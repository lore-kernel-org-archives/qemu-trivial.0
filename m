Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TUhpG-0003rm-4I
	for mharc-qemu-trivial@gnu.org; Sat, 03 Nov 2012 13:48:06 -0400
Received: from eggs.gnu.org ([208.118.235.92]:46183)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cardoe@cardoe.com>) id 1TUhpD-0003rU-My
	for qemu-trivial@nongnu.org; Sat, 03 Nov 2012 13:48:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cardoe@cardoe.com>) id 1TUhpC-0004rT-SQ
	for qemu-trivial@nongnu.org; Sat, 03 Nov 2012 13:48:03 -0400
Received: from mail-ob0-f173.google.com ([209.85.214.173]:51777)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cardoe@cardoe.com>) id 1TUhpC-0004rK-N0
	for qemu-trivial@nongnu.org; Sat, 03 Nov 2012 13:48:02 -0400
Received: by mail-ob0-f173.google.com with SMTP id wc18so4153998obb.4
	for <qemu-trivial@nongnu.org>; Sat, 03 Nov 2012 10:48:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:x-gm-message-state;
	bh=jls7inPUASK+juehqa0rCwjnDWBRxf1jgP+JcfQ6Vbk=;
	b=Nqkxam/4BbRtdmMJBrO3rhYMMmMToJdVeDr+JHs8wp1HTgIk3Vof5opqQXO06au/Uv
	nVD6nAsnKxu5hXQ0Yuc8aB8WwvLxjeuNsP0qYX595f8bKaWV7F/6AaaILtDQT4AKIuki
	ABFQZ0n5Ah8NrFt5tftYt7h2X/cJT+GXmvr3hKRh1hV/s0zROYSbJLEcADGbSpMXCvHi
	4PnECZ/13+5RFPm/qjQgChODqhz63aLBsOFbYu0nuShyXvQP7Yjw+UrPmYMh6Fl6e8K8
	bC8Kk1cU04cr1RIO4hdSKCfFJFetlE32aOEX9czqBfFLoHSbJJ7p8h3hqi9vZlIYpbIo
	Aztw==
MIME-Version: 1.0
Received: by 10.60.29.3 with SMTP id f3mr4092503oeh.97.1351964881766; Sat, 03
	Nov 2012 10:48:01 -0700 (PDT)
Sender: cardoe@cardoe.com
Received: by 10.60.174.11 with HTTP; Sat, 3 Nov 2012 10:48:01 -0700 (PDT)
In-Reply-To: <ca6867dfc9e12d5bbd88a18e2402c63714fe5c01.1351957436.git.blauwirbel@gmail.com>
References: <ca6867dfc9e12d5bbd88a18e2402c63714fe5c01.1351957436.git.blauwirbel@gmail.com>
Date: Sat, 3 Nov 2012 12:48:01 -0500
X-Google-Sender-Auth: UhfBDrO3nXSW5EkdQxNUHebr7jo
Message-ID: <CAFWqQMS6caqjNvF_2iK3gR+gDamL9OnDOsmwUpueMwyF2rSEYw@mail.gmail.com>
From: Doug Goldstein <cardoe@gentoo.org>
To: Blue Swirl <blauwirbel@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQnPQbmdngLxjEKe8yiCw6fMYYbOObOY4VcX2IBRi2cVb8+McifA+BeP5+xOVah600FD9lWU
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.214.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] libseccomp: require version
	1.0.0
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
X-List-Received-Date: Sat, 03 Nov 2012 17:48:04 -0000

On Sat, Nov 3, 2012 at 10:44 AM, Blue Swirl <blauwirbel@gmail.com> wrote:
> Debian Wheezy has version 0.1.0 which is not compatible, avoid it.
>
> Signed-off-by: Blue Swirl <blauwirbel@gmail.com>
> ---
>  configure |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/configure b/configure
> index 8e70cbb..b6948f7 100755
> --- a/configure
> +++ b/configure
> @@ -1383,7 +1383,7 @@ fi
>  # libseccomp check
>
>  if test "$seccomp" != "no" ; then
> -    if $pkg_config libseccomp --modversion >/dev/null 2>&1; then
> +    if $pkg_config --atleast-version=1.0.0 libseccomp --modversion >/dev/null 2>&1; then
>          LIBS=`$pkg_config --libs libseccomp`
>         seccomp="yes"
>      else
> --
> 1.7.2.5
>
>

I can confirm this will fix the compile issue when you've got
libseccomp 0.1.0, so ACK from a non-maintainer.


-- 
Doug Goldstein

