Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gez9N-0001YM-66
	for mharc-qemu-trivial@gnu.org; Thu, 03 Jan 2019 04:18:49 -0500
Received: from eggs.gnu.org ([208.118.235.92]:53915)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pmathieu@redhat.com>) id 1gez9L-0001Wf-0j
	for qemu-trivial@nongnu.org; Thu, 03 Jan 2019 04:18:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pmathieu@redhat.com>) id 1gez9H-0001tk-Ls
	for qemu-trivial@nongnu.org; Thu, 03 Jan 2019 04:18:46 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:42764)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pmathieu@redhat.com>) id 1gez9H-0001rt-Dk
	for qemu-trivial@nongnu.org; Thu, 03 Jan 2019 04:18:43 -0500
Received: by mail-wr1-f65.google.com with SMTP id q18so32880671wrx.9
	for <qemu-trivial@nongnu.org>; Thu, 03 Jan 2019 01:18:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=jAbcCZhhFmRVBQFWwQQtT0GV8DQE3YDtIaxGtXB3HtY=;
	b=DNwMkY9HQHT82QRgLpzDTpX+TARewuiGH+t1zjcK0L7Emn3t+Rl7tKPfnpSGLR5GNn
	UwDH0dvenh+5GY8DZHbiDggqhFsAhu1dzkWWMDsaYj+hkcxJ6JgKQkQQXOTjlQZJEr0v
	v1NbdX7vgzCA0tl+rY/V+PXtG4PPCzKgcCh0uYWbl1dyT0dH3pEJDAXlen/QstF29M+8
	uAwOx3pqr8KrpxK4TANUCBcATfTvfNpqBumML1SjKgsH6JeNCro4eU793B742jrosldd
	Vni5VbHg1tpYtarSzobCNryNpnaHJxG4aCuXfkeoq77GxtMoY1gZfsN+mXtQoMjO1Ypd
	9PZg==
X-Gm-Message-State: AJcUukf5RaT6tuiQpassJOY3bLTgQS8pN0NHtmq5Lz37xPT+edU/YR3A
	0as/R7AaxOZ/pCiHoUzTXmOgEUnYvTBw5h2poLDUJA==
X-Google-Smtp-Source: ALg8bN6jmP0pnTPQ+5KHLCDdA1dmyIegeKAON8ssgogmJZoi0AymZboJhYvAfhtybS/YxZgBGiuZtKgeFgBx45SXW98=
X-Received: by 2002:adf:ee07:: with SMTP id y7mr42448012wrn.187.1546507121551; 
	Thu, 03 Jan 2019 01:18:41 -0800 (PST)
MIME-Version: 1.0
References: <154645087925.9907.8533035759502851896@02a1dbf831e2>
	<e122954c-760c-47ac-3858-1c25e0b2f9ff@redhat.com>
In-Reply-To: <e122954c-760c-47ac-3858-1c25e0b2f9ff@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Date: Thu, 3 Jan 2019 10:18:30 +0100
Message-ID: <CAP+75-X27ep7r5oeg9HQY6T4h0TF3YSHHdw--O5Kb-vAADtnJg@mail.gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>, 
	Markus Armbruster <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>
Cc: Fam Zheng <fam@euphon.net>, David Hildenbrand <david@redhat.com>, 
	QEMU Trivial <qemu-trivial@nongnu.org>, Cornelia Huck <cohuck@redhat.com>, 
	Michael Roth <mdroth@linux.vnet.ibm.com>,
	Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.65
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 0/3] cutils: Cleanup,
 improve documentation
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
X-List-Received-Date: Thu, 03 Jan 2019 09:18:48 -0000

Cc'ing Markus and Thomas who reviewed commit 8c06fbdf36b.

On Thu, Jan 3, 2019 at 10:04 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
> On 1/2/19 6:41 PM, no-reply@patchew.org wrote:
> > Patchew URL: https://patchew.org/QEMU/20181226171538.21984-1-philmd@red=
hat.com/
> [...]> =3D=3D=3D OUTPUT BEGIN =3D=3D=3D
> > Checking PATCH 1/3: util/cutils: Move size_to_str() from "qemu-common.h=
" to "cutils.h"...
> > WARNING: Block comments use a leading /* on a separate line
> > #42: FILE: include/qemu/cutils.h:160:
> > +/**
>
> I believe this warning is incorrect, since we use the /** marking for
> Doxygen generated documentation. The offending comment is:
>
>   /**
>    * size_to_str:
>    *
>    * Return human readable string for size @val.
>    * Use IEC binary units like KiB, MiB, and so forth.
>    *
>    * @val: The value to format.
>    *       Can be anything that uint64_t allows (no more than "16 EiB").
>    *
>    * Caller is responsible for passing it to g_free().
>    */
>    char *size_to_str(uint64_t val);
>
> Am I missing something?

I had a quick look at scripts/checkpatch.pl:

  # Block comment styles

      # Block comments use /* on a line of its own
      if ($rawline !~ m@^\+.*/\*.*\*/[ \t]*$@ &&    #inline /*...*/
          $rawline =3D~ m@^\+.*/\*\*?[ \t]*.+[ \t]*$@) { # /* or /** non-bl=
ank
          WARN("Block comments use a leading /* on a separate line\n"
. $herecurr);
      }

I am confused because the comment says it allow blank /**, which is
the case here.

