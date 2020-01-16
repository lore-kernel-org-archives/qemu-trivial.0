Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1is6IK-00028H-5P
	for mharc-qemu-trivial@gnu.org; Thu, 16 Jan 2020 09:38:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36551)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <damien.hedde@greensocs.com>) id 1is1Fz-0005qd-1L
 for qemu-trivial@nongnu.org; Thu, 16 Jan 2020 04:16:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <damien.hedde@greensocs.com>) id 1is1Fv-0003cF-4X
 for qemu-trivial@nongnu.org; Thu, 16 Jan 2020 04:16:02 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:60324)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <damien.hedde@greensocs.com>)
 id 1is1Fm-0003Vj-8v; Thu, 16 Jan 2020 04:15:50 -0500
Received: from [172.16.11.102] (crumble.bar.greensocs.com [172.16.11.102])
 by beetle.greensocs.com (Postfix) with ESMTPSA id F3B5D96EF0;
 Thu, 16 Jan 2020 09:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1579166147;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GwMj4KOH/c7H14TR4bcZ6XDPi+thgb4RlXzXEpnoDDE=;
 b=LLPYO9hS4PTXOdKi005L+zg6hM9fH4uoK8PcRHMZHtBUXkOHJ8HKd3OZiCrb1n8c80XRNM
 i2arRJzrnZq/GPsa0HymPPCOj6HfaqvcmH0j6OuPVYbHIC5QseFBE6kCky8lF4+QDr+KC4
 2jjM2Y11cg0isGfU74+bXs8euZiFVAs=
Subject: Re: [PATCH] Makefile: Keep trace-events-subdirs ordered
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-trivial@nongnu.org,
 Alexey Kardashevskiy <aik@ozlabs.ru>, Laurent Vivier <lvivier@redhat.com>
References: <20200116091314.25024-1-philmd@redhat.com>
From: Damien Hedde <damien.hedde@greensocs.com>
Message-ID: <199edf22-023f-ccd2-f4af-6c97f8fce749@greensocs.com>
Date: Thu, 16 Jan 2020 10:15:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200116091314.25024-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US-large
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com; 
 s=mail; t=1579166147;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GwMj4KOH/c7H14TR4bcZ6XDPi+thgb4RlXzXEpnoDDE=;
 b=N06w/YU3rgciw7z+bn+v2lkJtng38eUOV2/eIwx4jpzMPMFhVwvbGTxLTkzW2NQN1ge+uS
 sWLqVDt0Mzc9FjjQqcTGRzFLyScXvumQWyi2ZchN3S42mMK469HGJFK4Es5cs1A7IrhU86
 bbItAoKXCLUaqB8+QPTMTQ1zpMwgXeE=
ARC-Seal: i=1; s=mail; d=greensocs.com; t=1579166147; a=rsa-sha256; cv=none;
 b=jFuT9OFAi4TMaMjSvhkkbGM4Hk+i5peCWtKMU5AZSj747idegbEEc+EzMZc+rJrmlcCCG8
 O5CVQ9gRQT9hDLnHi2kwzZWqwcyZmktLr3K8BtKNvDVZ1SD2neZqF2nkjjGiY129bVB/Pt
 J/F/n21YGari893gOfJ+/4QoEyZJvjQ=
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.auth=damien smtp.mailfrom=damien.hedde@greensocs.com
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 5.135.226.135
X-Mailman-Approved-At: Thu, 16 Jan 2020 09:38:46 -0500
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 16 Jan 2020 09:16:06 -0000



On 1/16/20 10:13 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> To ease review and reduce likelihood of merge failures (see [*]),
> keep trace-events-subdirs ordered when possible, following eb7ccb3c0.
>=20
> [*] https://www.mail-archive.com/qemu-devel@nongnu.org/msg671007.html
>     Duplicate trace-events-subdirs entries generates duplicated
>     symbols when using the LTTng Userspace Tracer library.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> "Fixes: 26b8e6dc & 8d5d515a0"
>=20
> To be even safer we should use $(sort $(trace-events-subdirs))
> ---
>  Makefile.objs | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/Makefile.objs b/Makefile.objs
> index 7c1e50f9d6..d62f908965 100644
> --- a/Makefile.objs
> +++ b/Makefile.objs
> @@ -142,8 +142,8 @@ trace-events-subdirs +=3D nbd
>  trace-events-subdirs +=3D scsi
>  endif
>  ifeq ($(CONFIG_SOFTMMU),y)
> -trace-events-subdirs +=3D chardev
>  trace-events-subdirs +=3D audio
> +trace-events-subdirs +=3D chardev
>  trace-events-subdirs +=3D hw/9pfs
>  trace-events-subdirs +=3D hw/acpi
>  trace-events-subdirs +=3D hw/alpha
> @@ -191,6 +191,7 @@ trace-events-subdirs +=3D migration
>  trace-events-subdirs +=3D net
>  trace-events-subdirs +=3D ui
>  endif
> +trace-events-subdirs +=3D hw/core
>  trace-events-subdirs +=3D hw/display
>  trace-events-subdirs +=3D qapi
>  trace-events-subdirs +=3D qom
> @@ -203,7 +204,6 @@ trace-events-subdirs +=3D target/riscv
>  trace-events-subdirs +=3D target/s390x
>  trace-events-subdirs +=3D target/sparc
>  trace-events-subdirs +=3D util
> -trace-events-subdirs +=3D hw/core
> =20
>  trace-events-files =3D $(SRC_PATH)/trace-events $(trace-events-subdirs=
:%=3D$(SRC_PATH)/%/trace-events)
> =20
>=20

Reviewed-by: Damien Hedde <damien.hedde@greensocs.com>

