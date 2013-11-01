Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VcBzG-00087v-14
	for mharc-qemu-trivial@gnu.org; Fri, 01 Nov 2013 06:29:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39930)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VcBz7-0007wF-Us
	for qemu-trivial@nongnu.org; Fri, 01 Nov 2013 06:29:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VcBz1-000115-VC
	for qemu-trivial@nongnu.org; Fri, 01 Nov 2013 06:29:45 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:43374)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VcByp-0000zp-Nj; Fri, 01 Nov 2013 06:29:27 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 93B9A4003C;
	Fri,  1 Nov 2013 14:29:24 +0400 (MSK)
Message-ID: <52738284.5090708@msgid.tls.msk.ru>
Date: Fri, 01 Nov 2013 14:29:24 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130922 Icedove/17.0.9
MIME-Version: 1.0
To: Antony Pavlov <antonynpavlov@gmail.com>
References: <1383021391-3152-1-git-send-email-antonynpavlov@gmail.com>
In-Reply-To: <1383021391-3152-1-git-send-email-antonynpavlov@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Anthony Liguori <aliguori@amazon.com>
Subject: Re: [Qemu-trivial] [PATCH] vl: fix build when configured with no
 graphic support
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Nov 2013 10:29:52 -0000

29.10.2013 08:36, Antony Pavlov wrote
> The following error occurs when building no graphic output support:
>
>    vl.c: In function =E2=80=98main=E2=80=99:
>    vl.c:2829:19: error: variable =E2=80=98ds=E2=80=99 set but not used =
[-Werror=3Dunused-but-set-variable]
>         DisplayState *ds;
>                       ^
>    cc1: all warnings being treated as errors

Thanks, applied to the trivial-patches queue.

While at it, I also added a comment to the line being added,
telling what this is all about:

--- a/vl.c
+++ b/vl.c
@@ -4269,6 +4269,7 @@ int main(int argc, char **argv, char **envp)
      /* init local displays */
      switch (display_type) {
      case DT_NOGRAPHIC:
+        (void)ds;      /* avoid warning if no display is configured */
          break;
  #if defined(CONFIG_CURSES)
      case DT_CURSES:

Hopefully it is okay... ;)

/mjt

