Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dXQ9v-0007mF-6x
	for mharc-qemu-trivial@gnu.org; Tue, 18 Jul 2017 06:55:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49342)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1dXQ9t-0007kQ-5p
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 06:55:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1dXQ9s-0007yr-6r
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 06:55:17 -0400
Received: from mail-wr0-x244.google.com ([2a00:1450:400c:c0c::244]:36486)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <marcandre.lureau@gmail.com>)
	id 1dXQ9r-0007yf-TO; Tue, 18 Jul 2017 06:55:16 -0400
Received: by mail-wr0-x244.google.com with SMTP id y67so1682728wrb.3;
	Tue, 18 Jul 2017 03:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=OjpxXLaJl5Y8/yUEcwHaUit6CQdgSOpJJFTaf1/jSTM=;
	b=byrnIZl+g/ChcWLKSEcae9Dp+ymmMOeVENNRAFLN6rgIj3atpStR3fYcrbdGAFKeRD
	Il7R0RAr0PS5v/lnnhlwcssjcBxr+7lfRmvOxzIPlH2VbW9krlhDeDfH2VI1fqbaKKdV
	u1ppVOBppm2Q5FvKxyYWUoomJtMksHQZ++kX6/uRjHEUmfSOTi8/pwPgCdND7nsK2J8f
	WtVKuMzSUI67wG9dSUZ4YwU/z2hVjwNFd34JobxYl2Dz7WImYKioxYePoMYSyojgEhk0
	2Sm6x6PEJLCF9nSK3U3Nzq7ZE5aKiD+2oTyV6xm6rCky85RPtg8FHWvLI2EbLJoIdBl1
	QY+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=OjpxXLaJl5Y8/yUEcwHaUit6CQdgSOpJJFTaf1/jSTM=;
	b=MnoHnf7uXQZormq9q7pZhsZ+AWc4iPhuYZ5JUKxD6rn+ts57nt53GyfNuGsIQx6ooH
	Rx5FlK4yTn6VLmWm91Zwspx6JKvuyVvAOv0T34dVZ0OLl8ih3WymKsTwyC7S4bkDQSWw
	YhxCfcthuqtIEc5tDIr0/gJjAXOpEOkIWXlqvpo2zPhPzDIyuUgLNrGjoJleb4RyrjYC
	pd/En0MHufZljNUVYIFMmIjuhntEj69z/CATYJks0/O8KXTdrVKpKH/SHKMIsXDP2zWV
	bxLe3hjrJ9c4JG4gaVlQ2XMAMfxW14n76h1YpeYsSp3ITKUwYwlLX1UXSQGn4bZWmUat
	A4Ag==
X-Gm-Message-State: AIVw111r66ICCnPXUCqhYv2xgW/asMbgxQY8MYuPliH9KIAI8leqcPc0
	iAtTVR+T40Vk9DCTpF+e0HEk36SOek4c
X-Received: by 10.80.184.27 with SMTP id j27mr1484304ede.132.1500375314751;
	Tue, 18 Jul 2017 03:55:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.175.70 with HTTP; Tue, 18 Jul 2017 03:55:13 -0700 (PDT)
In-Reply-To: <20170718061005.29518-21-f4bug@amsat.org>
References: <20170718061005.29518-1-f4bug@amsat.org>
	<20170718061005.29518-21-f4bug@amsat.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 18 Jul 2017 03:55:13 -0700
Message-ID: <CAJ+F1C+rOqgpOgWTirC03Kjx7OJvV8SGX=OCE8GJqG4AVUQNhw@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: qemu trival <qemu-trivial@nongnu.org>,
	Aurelien Jarno <aurelien@aurel32.net>, 
	Laurent Vivier <laurent@vivier.eu>, Richard Henderson <rth@twiddle.net>,
	David Gibson <david@gibson.dropbear.id.au>,
	Alexander Graf <agraf@suse.de>, 
	"open list:sPAPR pseries" <qemu-ppc@nongnu.org>,
	QEMU <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::244
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 20/29] disas: use ARRAY_SIZE
 macro
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Jul 2017 10:55:18 -0000

On Mon, Jul 17, 2017 at 11:09 PM, Philippe Mathieu-Daud=C3=A9
<f4bug@amsat.org> wrote:
> Applied using the Coccinelle semantic patch scripts/coccinelle/use_osdep.=
cocci
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  disas/ia64.c |  4 ++--
>  disas/m68k.c |  5 ++---
>  disas/ppc.c  | 12 ++++--------
>  disas/s390.c |  3 +--
>  4 files changed, 9 insertions(+), 15 deletions(-)
>
> diff --git a/disas/ia64.c b/disas/ia64.c
> index 140754c944..a668a49f69 100644
> --- a/disas/ia64.c
> +++ b/disas/ia64.c
> @@ -385,7 +385,7 @@ struct ia64_operand
>  /* Disassemble as unsigned decimal (instead of hex): */
>  #define IA64_OPND_FLAG_DECIMAL_UNSIGNED        (1<<1)
>
> -#define NELEMS(a)      ((int) (sizeof (a) / sizeof (a[0])))
> +#define NELEMS(a) ((int) ARRAY_SIZE(a))
>
>  static const char*
>  ins_rsvd (const struct ia64_operand *self ATTRIBUTE_UNUSED,
> @@ -2857,7 +2857,7 @@ static const unsigned short dep257[] =3D {
>    2170, 2173, 2274, 2284, 2327, 4135, 20616, 28866, 29018,
>  };
>
> -#define NELS(X) (sizeof(X)/sizeof(X[0]))
> +#define NELS(X) ARRAY_SIZE(X)

You may want to replace NELEMS & NELS with ARRAY_SIZE instead.

>  static const struct ia64_opcode_dependency
>  op_dependencies[] =3D {
>    { NELS(dep1), dep1, NELS(dep0), dep0, },
> diff --git a/disas/m68k.c b/disas/m68k.c
> index 61b689ef3e..9989989e02 100644
> --- a/disas/m68k.c
> +++ b/disas/m68k.c
> @@ -4197,7 +4197,7 @@ TBL("tblunb", "tblunw", "tblunl", 0, 0),
>  {"wdebug", 4,  two(0175750, 03),       two(0177770, 0xffff), "ds", mcfis=
a_a },
>  };
>
> -const int m68k_numopcodes =3D sizeof m68k_opcodes / sizeof m68k_opcodes[=
0];
> +const int m68k_numopcodes =3D ARRAY_SIZE(m68k_opcodes);
>
>  /* These aliases used to be in the above table, each one duplicating
>     all of the entries for its primary exactly.  This table was
> @@ -4450,8 +4450,7 @@ const struct m68k_opcode_alias m68k_opcode_aliases[=
] =3D
>
>  };
>
> -const int m68k_numaliases =3D
> -  sizeof m68k_opcode_aliases / sizeof m68k_opcode_aliases[0];
> +const int m68k_numaliases =3D ARRAY_SIZE(m68k_opcode_aliases);
>  /* **** End of m68k-opc.c */
>  /* **** floatformat.c from sourceware.org CVS 2005-08-14.  */
>  /* IEEE floating point support routines, for GDB, the GNU Debugger.
> diff --git a/disas/ppc.c b/disas/ppc.c
> index 5ab9c35a84..337415b887 100644
> --- a/disas/ppc.c
> +++ b/disas/ppc.c
> @@ -893,8 +893,7 @@ const struct powerpc_operand powerpc_operands[] =3D
>    { 0x1, 25, NULL, NULL, PPC_OPERAND_OPTIONAL},
>  };
>
> -const unsigned int num_powerpc_operands =3D (sizeof (powerpc_operands)
> -                                          / sizeof (powerpc_operands[0])=
);
> +const unsigned int num_powerpc_operands =3D ARRAY_SIZE(powerpc_operands)=
;
>
>  /* The functions used to insert and extract complicated operands.  */
>
> @@ -5029,10 +5028,8 @@ const struct powerpc_opcode powerpc_opcodes[] =3D =
{
>
>  };
>
> -const int powerpc_num_opcodes =3D
> -  sizeof (powerpc_opcodes) / sizeof (powerpc_opcodes[0]);
> -
> -/* The macro table.  This is only used by the assembler.  */
> +const int powerpc_num_opcodes =3D ARRAY_SIZE(powerpc_opcodes);
> +/* The macro table.  This is only used by the assembler. */
>
>  /* The expressions of the form (-x ! 31) & (x | 31) have the value 0
>     when x=3D0; 32-x when x is between 1 and 31; are negative if x is
> @@ -5086,8 +5083,7 @@ const struct powerpc_macro powerpc_macros[] =3D {
>  { "clrlslwi.",4,  PPCCOM,      "rlwinm. %0,%1,%3,(%2)-(%3),31-(%3)" },
>  };
>
> -const int powerpc_num_macros =3D
> -  sizeof (powerpc_macros) / sizeof (powerpc_macros[0]);
> +const int powerpc_num_macros =3D ARRAY_SIZE(powerpc_macros);
>
>
>  /* This file provides several disassembler functions, all of which use
> diff --git a/disas/s390.c b/disas/s390.c
> index 1f167d2eaa..ffa1519622 100644
> --- a/disas/s390.c
> +++ b/disas/s390.c
> @@ -1893,5 +1893,4 @@ static const struct s390_opcode s390_opcodes[] =3D
>    { "pr", OP16(0x0101LL), MASK_E, INSTR_E, 3, 0},
>  };
>
> -static const int s390_num_opcodes =3D
> -  sizeof (s390_opcodes) / sizeof (s390_opcodes[0]);
> +static const int s390_num_opcodes =3D ARRAY_SIZE(s390_opcodes);
> --
> 2.13.2
>
>



--=20
Marc-Andr=C3=A9 Lureau

