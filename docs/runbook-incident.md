# Runbook — Incident "appareil perdu"

## Déclenchement
Un appareil Android géré par la plateforme EMM est signalé perdu ou volé par son utilisateur.

## Procédure

1. **Ouvrir une fiche incident** : `INC-YYYYMMDD-<numéro>`
2. **Identifier l'appareil** dans Headwind MDM (Devices) : nom, configuration actuelle, dernière
   connexion (`last seen`), utilisateur affecté.
3. **Mettre en quarantaine** : basculer l'appareil vers la configuration `CFG-QUARANTAINE`
   (retrait des applications sensibles, restrictions renforcées).
4. **Verrouiller ou effacer** l'appareil si la solution et son état le permettent.
5. **Collecter les preuves** : capture de l'inventaire Headwind, de la configuration appliquée,
   et des événements CloudTrail/Security Hub pertinents → les stocker dans le bucket S3 evidence
   (`incident/`).
6. **Évaluer l'impact** : applications présentes sur l'appareil, données potentiellement exposées,
   niveau d'urgence.
7. **Proposer des mesures correctives** : ex. réduction du délai de `last seen` toléré avant
   verrouillage automatique, authentification multi-facteurs, chiffrement renforcé du terminal.

## Modèle de fiche incident

| Champ | Valeur |
|---|---|
| Référence | INC-YYYYMMDD-XXX |
| Déclarant | — |
| Appareil | DEV-PAR-BASE-001 |
| Dernier contact | — |
| Configuration | CFG-BASE-CORP → CFG-QUARANTAINE |
| Risque principal | Accès applicatif / fuite de données / usurpation |
| Action immédiate | Quarantaine / verrouillage / effacement |
| Preuves | s3://<bucket-evidence>/incident/... |
| Décision finale | Acceptation / remédiation / escalade |
