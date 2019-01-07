Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ggTny-0000yl-7Q
	for mharc-qemu-trivial@gnu.org; Mon, 07 Jan 2019 07:14:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45280)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1ggTnw-0000x9-3p
	for qemu-trivial@nongnu.org; Mon, 07 Jan 2019 07:14:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1ggTnv-0006xS-Bl
	for qemu-trivial@nongnu.org; Mon, 07 Jan 2019 07:14:52 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:35851)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <marcandre.lureau@gmail.com>)
	id 1ggTnt-0006w2-IM; Mon, 07 Jan 2019 07:14:49 -0500
Received: by mail-wr1-x442.google.com with SMTP id u4so191725wrp.3;
	Mon, 07 Jan 2019 04:14:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=2vuar0L4wVH0YegFNWcuX70oO9kXvQ24Qf8gL6QmfN4=;
	b=ZwL3ydegtLSg4DxLfJYyhKJexZfS5XRzDhvf5hLgtibzfScTnG5bkZSRil8nrLEEze
	PI1f7tuJ9ddpffNmLJNTEbWT/d41E0D6OHLh2gU/7GOEH0gxmoMLgaVUpA98itEimYqh
	Q3ZoHHguonQlO2wmjRjJ8b2x84tsuHx7yvrbp9gCKD57/utIHfo+2ZC4Q7xyyj38dBUr
	WrjxrPCeODoHqUWL+Mu8q5Wf4f84Qt0pVHezODCBPQzqXaekWzj5zlG6t/jMGZTicugE
	9Y81C2sTIZ6jiKZI1dl6ZVs4moQFy8cBefxTNw3MRA20G8qIADghsYwKbhtOsePH6R5L
	gUEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=2vuar0L4wVH0YegFNWcuX70oO9kXvQ24Qf8gL6QmfN4=;
	b=ZxQU2rYBYro3R/4ebkkTzzl000RucZDEyb9mJHddWXW9LcMF+0U72ZI0VqnFvo7GrQ
	sKbD+c9ynZ3RbhXXNIuiIURy8WJ9BZOyoYB0/7o0hXjuIqSIDmCDL0IQfENTcjVwCDSk
	QCyEeEiDfDhKBJKoMaE++LWG0Ke7RrIEaZfgvDaS80fgRVYJ7xyaLIIGf545YF4zFcxm
	5xFEmM/YcXqnxWUarK+ZUFzp+BSuD3bGPIdqGete4etPLbpSWUBRUVP1F0hDzVYNPHyE
	NzNmUM5BBimPO56wDBxa3LIkjHtRQhxvNI+Gwputv9PPbsS/Y1Twt6QI88I0G9KDnhxh
	YY6Q==
X-Gm-Message-State: AJcUukffL8jwv++Y8DHqRWRE9bZgijKaw4ZOALVf/RfxskftIgw6A+FN
	d/iLaYL+G8EmAam9eFGdpanBFO8KYPq16tE4RYU=
X-Google-Smtp-Source: ALg8bN7GLUiazITov9PeRBPA2BQtc4Ld+ApMmgth6KcysrxA/NoE8nJJaxdjnDQDWMmdzWUP1mW+0DJOTCnToztXDg8=
X-Received: by 2002:adf:f691:: with SMTP id v17mr49506397wrp.114.1546863287835;
	Mon, 07 Jan 2019 04:14:47 -0800 (PST)
MIME-Version: 1.0
References: <20181225125344.4482-1-arilou@gmail.com>
In-Reply-To: <20181225125344.4482-1-arilou@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 7 Jan 2019 16:14:36 +0400
Message-ID: <CAJ+F1CJN=Gn5GYqrOeqWFNryw=q+7q8TDUX0VQEzrtS8tbUeQg@mail.gmail.com>
To: Jon Doron <arilou@gmail.com>
Cc: QEMU <qemu-devel@nongnu.org>, qemu trival <qemu-trivial@nongnu.org>, 
	Laszlo Ersek <lersek@redhat.com>, Wen Congyang <wency@cn.fujitsu.com>, 
	Luiz Capitulino <lcapitulino@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::442
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v1] dump: Set correct vaddr
 for ELF dump
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
X-List-Received-Date: Mon, 07 Jan 2019 12:14:53 -0000

Hi

On Tue, Dec 25, 2018 at 5:52 PM Jon Doron <arilou@gmail.com> wrote:
>
> vaddr needs to be equal to the paddr since the dump file represents the
> physical memory image.
>
> Without setting vaddr correctly, GDB would load all the different memory
> regions on top of each other to vaddr 0, thus making GDB showing the wron=
g
> memory data for a given address.
>
> Signed-off-by: Jon Doron <arilou@gmail.com>

This is a non-trivial patch! (qemu-trivial, please ignore).

> ---
>  dump.c                       | 4 ++--
>  scripts/dump-guest-memory.py | 1 +
>  2 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/dump.c b/dump.c
> index 4ec94c5e25..bf77a119ea 100644
> --- a/dump.c
> +++ b/dump.c
> @@ -192,7 +192,7 @@ static void write_elf64_load(DumpState *s, MemoryMapp=
ing *memory_mapping,
>      phdr.p_paddr =3D cpu_to_dump64(s, memory_mapping->phys_addr);
>      phdr.p_filesz =3D cpu_to_dump64(s, filesz);
>      phdr.p_memsz =3D cpu_to_dump64(s, memory_mapping->length);
> -    phdr.p_vaddr =3D cpu_to_dump64(s, memory_mapping->virt_addr);
> +    phdr.p_vaddr =3D phdr.p_paddr;

This is likely breaking paging=3Dtrue somehow, which sets
memory_mapping->virt_addr to non-0.

According to doc "If you want to use gdb to process the core, please
set @paging to true."

Although I am not able to (gdb) x/10bx 0xa0000 for example on a core
produced with paging. Not sure why, anybody could help?

>      assert(memory_mapping->length >=3D filesz);
>
> @@ -216,7 +216,7 @@ static void write_elf32_load(DumpState *s, MemoryMapp=
ing *memory_mapping,
>      phdr.p_paddr =3D cpu_to_dump32(s, memory_mapping->phys_addr);
>      phdr.p_filesz =3D cpu_to_dump32(s, filesz);
>      phdr.p_memsz =3D cpu_to_dump32(s, memory_mapping->length);
> -    phdr.p_vaddr =3D cpu_to_dump32(s, memory_mapping->virt_addr);
> +    phdr.p_vaddr =3D phdr.p_paddr;
>
>      assert(memory_mapping->length >=3D filesz);
>
> diff --git a/scripts/dump-guest-memory.py b/scripts/dump-guest-memory.py
> index 198cd0fe40..2c587cbefc 100644
> --- a/scripts/dump-guest-memory.py
> +++ b/scripts/dump-guest-memory.py
> @@ -163,6 +163,7 @@ class ELF(object):
>          phdr =3D get_arch_phdr(self.endianness, self.elfclass)
>          phdr.p_type =3D p_type
>          phdr.p_paddr =3D p_paddr
> +        phdr.p_vaddr =3D p_paddr

With your proposed change though, I can dump memory with gdb...

>          phdr.p_filesz =3D p_size
>          phdr.p_memsz =3D p_size
>          self.segments.append(phdr)
> --
> 2.19.2
>
>


--=20
Marc-Andr=C3=A9 Lureau

