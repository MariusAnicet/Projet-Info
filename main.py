#!/usr/bin/env python3
"""
Point d'entree pour lancer l'API FastAPI via uvicorn.

Usage basique:
    python main.py

Mode developpement (reload automatique):
    python main.py --dev
"""

import argparse
import sys
from pathlib import Path

import uvicorn

SRC_DIR = Path(__file__).resolve().parent / "src"
sys.path.insert(0, str(SRC_DIR))


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Lancer le serveur Striv API.")
    parser.add_argument("--host", default="0.0.0.0", help="Adresse d'ecoute (defaut: 0.0.0.0).")
    parser.add_argument("--port", type=int, default=8001, help="Port d'ecoute (defaut: 8001).")
    parser.add_argument(
        "--reload",
        action="store_true",
        help="Active le rechargement automatique (equivalent au mode dev).",
    )
    parser.add_argument(
        "--dev",
        action="store_true",
        help="Alias de --reload pour rester compatible avec les anciens scripts.",
    )
    return parser.parse_args()


def print_banner(host: str, port: int, dev_mode: bool) -> None:
    mode_label = "Developpement" if dev_mode else "Production"
    base_url = f"http://{host}:{port}"
    print("=" * 60)
    print(">> Lancement de Striv API")
    print("=" * 60)
    print(f"Mode: {mode_label}")
    print(f"URL: {base_url}")
    print(f"Documentation: {base_url}/docs")
    print(f"ReDoc: {base_url}/redoc")
    print("=" * 60)
    print("Utilisateurs de test:")
    print("  - alice / wonderland")
    print("  - bob / builder")
    print("=" * 60)
    print("Endpoints utiles:")
    print("  - GET /health")
    print("  - GET /me")
    print("  - GET /stats/*")
    print("=" * 60)
    print("Ctrl+C pour stopper le serveur.")
    print("=" * 60)
    print()


def main() -> None:
    args = parse_args()
    dev_mode = args.reload or args.dev
    print_banner(args.host, args.port, dev_mode)

    config = {"app": "API:app", "host": args.host, "port": args.port}
    if dev_mode:
        config.update({"reload": True, "log_level": "debug"})

    try:
        uvicorn.run(**config)
    except KeyboardInterrupt:
        print("\nArret du serveur. A bientot !")


if __name__ == "__main__":
    main()
