"""This module provides the CLI functionality for our package."""

import click

from zamazingo import __version__
from zamazingo.resources import read_help_text


@click.command()
@click.option("--name", prompt="Your name", help="The person to greet.")
@click.option("--count", default=1, help="Number of greetings.")
@click.version_option(__version__, prog_name="zamazingo")
def main(name: str, count: int) -> None:
    """Run the CLI program."""
    for _ in range(count):
        click.secho(f"Hello {name}! I am zamazingo v{__version__}.", bold=True)

    click.echo()

    click.secho(read_help_text(), fg="yellow")
