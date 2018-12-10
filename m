Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gWRH8-0008Kc-RV
	for mharc-qemu-trivial@gnu.org; Mon, 10 Dec 2018 14:31:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48886)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1gWRH6-0008KU-Gc
	for qemu-trivial@nongnu.org; Mon, 10 Dec 2018 14:31:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1gWRH1-0007KE-HQ
	for qemu-trivial@nongnu.org; Mon, 10 Dec 2018 14:31:28 -0500
Received: from mail-yb1-f173.google.com ([209.85.219.173]:33197)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1gWRC6-0003BG-1k; Mon, 10 Dec 2018 14:26:18 -0500
Received: by mail-yb1-f173.google.com with SMTP id f125so5708925ybc.0;
	Mon, 10 Dec 2018 11:26:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=GCWOcmrULZE+8UYrXJAHfhumavHj25zVuWV+zbTLq1Q=;
	b=nMdvPwb7xEa/w1VzhwJ5uR0rGuormT+20o0+jMlNCEkauPD6YOsIG9k1F9agOpOzPC
	C3XniMRQajETURzhKFFHcBU1jWLH7XeLstQbgN0LI4VZn0vIz9OGiyDiN2oq91uXQ75P
	EFr1QludwThHlzM081xkf4Wxmxp8Ll2CNbxRXcftgl3TDmoZOsbssyOzFl9YdAf9U3YC
	ZwkMRKxXv6/QjvgaWGyRe+XXyzHT5+X6V196VHX0poN/Rjnt78C4fBNX1bv24Kp+BAOF
	q0Xk5CrKnU32oRfZjq+ByqzE/SWTfOa44d1K8YPZM8izw1OYdiERjBOOSPd/1vFK9Wqw
	9BAw==
X-Gm-Message-State: AA+aEWarOPZbDJsA95DaLwrp9LQ3eCPGekKb8xjsgKKOdTWAvh3XmZ0e
	hBS+k9X1yhFBjNux4ndjJ5lRwCah2hY/POWoL+I=
X-Google-Smtp-Source: AFSGD/WRoPHj2zBQhiBfqVAhnghidwegTkxWgY6UWEVvQgEFlTBv5WXDL06OBtEvmEKkKUNH+Dc3alKNTQf8lNzmrgg=
X-Received: by 2002:a25:3a04:: with SMTP id
	h4-v6mr13100766yba.32.1544469977287; 
	Mon, 10 Dec 2018 11:26:17 -0800 (PST)
MIME-Version: 1.0
References: <03506cf0-a204-f619-8ee4-4990a5e69af5@cea.fr>
In-Reply-To: <03506cf0-a204-f619-8ee4-4990a5e69af5@cea.fr>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Mon, 10 Dec 2018 20:26:05 +0100
Message-ID: <CAAdtpL5BdqUvHpVTpKuJ6R+yEHGi7U6T9rUK2PbL3nwC7F_3jA@mail.gmail.com>
To: fabrice.desclaux@cea.fr, Paolo Bonzini <pbonzini@redhat.com>, 
	Richard Henderson <rth@twiddle.net>,
	Eduardo Habkost <ehabkost@redhat.com>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>, 
	Laurent Vivier <laurent@vivier.eu>, camille.mougey@cea.fr
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.219.173
Subject: Re: [Qemu-trivial] [PATCH] Fixes i386 xchgq test
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
X-List-Received-Date: Mon, 10 Dec 2018 19:31:29 -0000

Hi Fabrice,

On Fri, Dec 7, 2018 at 5:06 PM <fabrice.desclaux@cea.fr> wrote:
>
> As "xchg" reads and writes both operands, the "+m" is required to avoid
> undefined behavior on -O2 compilation.
>
> Signed-off-by: Fabrice Desclaux <fabrice.desclaux@cea.fr>
> ---
>   tests/tcg/i386/test-i386.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/tcg/i386/test-i386.c b/tests/tcg/i386/test-i386.c
> index a29b41e764..18d5609665 100644
> --- a/tests/tcg/i386/test-i386.c
> +++ b/tests/tcg/i386/test-i386.c
> @@ -1137,7 +1137,7 @@ void test_xchg(void)
>       TEST_XCHG(xchgb, "b", "+q");
>
>   #if defined(__x86_64__)
> -    TEST_XCHG(xchgq, "", "=m");
> +    TEST_XCHG(xchgq, "", "+m");
>   #endif
>       TEST_XCHG(xchgl, "k", "+m");
>       TEST_XCHG(xchgw, "w", "+m");
> --
> 2.19.2

All QEMU patches has to go via the qemu-devel@nongnu.org list (you
only sent it to the trivial list).
I'm also Cc'ing the maintainers:

$ ./scripts/get_maintainer.pl -f tests/tcg/i386/test-i386.c
Paolo Bonzini <pbonzini@redhat.com> (maintainer:X86)
Richard Henderson <rth@twiddle.net> (maintainer:X86)
Eduardo Habkost <ehabkost@redhat.com> (maintainer:X86)
qemu-devel@nongnu.org (open list:All patches CC here)

Regards,

Phil.

