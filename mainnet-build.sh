cd ligo/src
rm -rf .build
mkdir -p .build

ligo compile contract escrow.jsligo --entry-point main  > ./.build/escrow.tz

ligo compile storage escrow.jsligo --entry-point main '
{
  admin: ("tz1bxwduvRwBhq59FmThGKD5ceDFadr57JTq" as address),
  pending_admin: None() as option<address>,
  paused: false,
}
' > ./.build/escrow_storage.tz
