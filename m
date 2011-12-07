Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RYGf6-0002Tc-LD
	for mharc-qemu-trivial@gnu.org; Wed, 07 Dec 2011 07:31:48 -0500
Received: from eggs.gnu.org ([140.186.70.92]:53936)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1RYGf3-0002Iy-Rh
	for qemu-trivial@nongnu.org; Wed, 07 Dec 2011 07:31:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1RYGez-0001eq-SV
	for qemu-trivial@nongnu.org; Wed, 07 Dec 2011 07:31:45 -0500
Received: from mail-qw0-f45.google.com ([209.85.216.45]:50812)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>)
	id 1RYGeq-0001dB-CO; Wed, 07 Dec 2011 07:31:32 -0500
Received: by qadz30 with SMTP id z30so3984243qad.4
	for <multiple recipients>; Wed, 07 Dec 2011 04:31:31 -0800 (PST)
MIME-Version: 1.0
Received: by 10.224.186.72 with SMTP id cr8mr16007656qab.95.1323261091567;
	Wed, 07 Dec 2011 04:31:31 -0800 (PST)
Received: by 10.229.226.211 with HTTP; Wed, 7 Dec 2011 04:31:31 -0800 (PST)
In-Reply-To: <CAEH94LgMfEgcqMh5ObAS1vpyVCkSTYz=a58tc0P7qGqwdddvqA@mail.gmail.com>
References: <1322905525-354-1-git-send-email-sw@weilnetz.de>
	<CAEH94LgMfEgcqMh5ObAS1vpyVCkSTYz=a58tc0P7qGqwdddvqA@mail.gmail.com>
Date: Wed, 7 Dec 2011 12:31:31 +0000
Message-ID: <CAFEAcA-sXKtM7=M2ZpdO5bKkxzrSL2w6MdYMNAzoiuQw5dJ_YQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
To: Zhi Yong Wu <zwu.kernel@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.216.45
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Convert keymap file to
	UTF-8 encoding
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
X-List-Received-Date: Wed, 07 Dec 2011 12:31:47 -0000

On 7 December 2011 12:13, Zhi Yong Wu <zwu.kernel@gmail.com> wrote:
> Can you let me know how you see that it is ISO-8859-1 coding, not
> UTF-8? They look same to me.

This gets a bit confusing because mail clients and
web browsers tend to try to fix up what they think are
wrongly labelled encodings, so for example in my mail
client the diff looks like it is not changing anything.
However if you look at the file in the current git repo
with a hex editor:
00000000  23 20 32 30 30 34 2d 30  33 2d 31 36 20 48 61 6c  |# 2004-03-16 Hal|
00000010  6c 64 f3 72 20 47 75 f0  6d 75 6e 64 73 73 6f 6e  |ld.r Gu.mundsson|

you can see that there is an 0xf3 at offset 0x12, which
is LATIN SMALL LETTER O WITH ACUTE in ISO-8859-1. ISO-8859-1
is a one-byte-per-character encoding which is why it has a
raw 0xf3 here. However although the character is at Unicode
codepoint 0xf3 as well, the encoding of this in UTF-8 is
the two byte sequence 0xc3 0xb3. Similarly the 0xf0 LATIN
SMALL LETTER ETH has to be encoded as 0xc3 0xb0.

If you look at the raw text of Stefan's email it reads:
-# 2004-03-16 Halld=F3r Gu=F0mundsson and Morten Lange
+# 2004-03-16 Halld=C3=B3r Gu=C3=B0mundsson and Morten Lange

which is the quoted-printable encoding of this change.

-- PMM

