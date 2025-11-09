from datetime import datetime
from typing import Optional
from sqlalchemy import Column, DateTime, ForeignKey, Integer, String
from sqlalchemy.ext.declarative import declarative_base

# Base locale pour ce module (évite les relations inter-bases).
Base = declarative_base()


class Commentaire(Base):
    """Modèle ORM pour la table `commentaire`."""

    __tablename__ = "commentaire"

    id_comment = Column(Integer, primary_key=True, autoincrement=True)
    id_user = Column(Integer, ForeignKey("utilisateur.id_user"), nullable=False)
    id_activite = Column(Integer, ForeignKey("activite.id"), nullable=False)
    contenu = Column(String, nullable=False)
    date_commentaire = Column(DateTime, nullable=False, default=datetime.now)

    def __init__(self, id_user: int, id_activite: int, contenu: str, date_commentaire: Optional[datetime] = None):
        self.id_user = id_user
        self.id_activite = id_activite
        self.contenu = contenu
        self.date_commentaire = date_commentaire or datetime.now()
