import click


@click.command()
@click.option("--name", prompt="Your name", help="The person to greet.")
@click.option("--count", default=1, help="Number of greetings.")
def greet(name: str, count: int) -> None:
    """
    Simple program that greets given NAME for a total of given COUNT times.
    """
    for _ in range(count):
        click.echo(f"Hello {name}!")


if __name__ == "__main__":
    greet()
