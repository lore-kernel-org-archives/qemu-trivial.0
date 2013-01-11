Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Tte5M-0006kA-KI
	for mharc-qemu-trivial@gnu.org; Fri, 11 Jan 2013 07:51:48 -0500
Received: from eggs.gnu.org ([208.118.235.92]:56793)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <v.e.evard@gmail.com>) id 1Tte5I-0006Xz-4i
	for qemu-trivial@nongnu.org; Fri, 11 Jan 2013 07:51:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <v.e.evard@gmail.com>) id 1Tte5C-0006uA-MQ
	for qemu-trivial@nongnu.org; Fri, 11 Jan 2013 07:51:44 -0500
Received: from mail-la0-f51.google.com ([209.85.215.51]:56774)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <v.e.evard@gmail.com>)
	id 1Tte54-0006t9-L5; Fri, 11 Jan 2013 07:51:30 -0500
Received: by mail-la0-f51.google.com with SMTP id fj20so1740514lab.10
	for <multiple recipients>; Fri, 11 Jan 2013 04:51:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:message-id:date:from:user-agent:mime-version:to:cc
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=tBiHPDzu/odZTFeBxn5XZbIZOA1xMhZL6iiNWh/cRD0=;
	b=AqiVho0PfUPbKFpb0ZAfqcULz5/vsxV2hCk4PKXl+qbVh+HTOypQUhhiG/evRq1RUj
	dDRhlDOiG21XynpH6OCMkOASjPwXTPJnLf5OPsW9oEcpdYZJm+JA/u0Pxzojx7IIDSxD
	6enKsv/reVcEcjS3XMYJHMSbqijNIPR5+sFfsZ9kv0R+jfKJJ7xl8rFrGponNNBnKCxB
	4p+YdKaEr5WoFJLmIeoTJ8fkaCPdVUGMz5RB/Xtd+F+rs5/jBoQ0EH6SzH/NekhrAQKt
	K9rZonpIKMoejLmoS6C5fcZ3snEV4txZiy1huNnmhBdLFwBRySoTm251TMKRisbZqN0T
	y9XQ==
X-Received: by 10.152.109.238 with SMTP id hv14mr14245128lab.30.1357908688890; 
	Fri, 11 Jan 2013 04:51:28 -0800 (PST)
Received: from [192.168.1.131] (host-157-157-66-217.spbmts.ru.
	[217.66.157.157])
	by mx.google.com with ESMTPS id fj2sm2084630lbb.6.2013.01.11.04.51.26
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 11 Jan 2013 04:51:27 -0800 (PST)
Message-ID: <50F00ACC.8020606@gmail.com>
Date: Fri, 11 Jan 2013 16:51:24 +0400
From: Vadim Evard <v.e.evard@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.11) Gecko/20121122 Icedove/10.0.11
MIME-Version: 1.0
To: qemu-devel@nongnu.org
References: <50E1BDC3.5040604@gmail.com>
In-Reply-To: <50E1BDC3.5040604@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.215.51
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] configure: try pkg-config
 for curses
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
X-List-Received-Date: Fri, 11 Jan 2013 12:51:47 -0000

ping

Пнд 31 Дек 2012 20:30:59, Vadim Evard писал:
> configure: try pkg-config for curses
>
> Static linkikng against ncurses may require explicit -ltinfo.
> In case -lcurses and -lncurses both didn't work give pkg-config a
> chance.
>
> Signed-off-by: Vadim Evard <v.e.evard@gmail.com>
> ---
> configure | 4 +++-
> 1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/configure b/configure
> index b0c7e54..16280e2 100755
> --- a/configure
> +++ b/configure
> @@ -2030,7 +2030,7 @@ fi
> if test "$mingw32" = "yes" ; then
> curses_list="-lpdcurses"
> else
> - curses_list="-lncurses -lcurses"
> + curses_list="-lncurses:-lcurses:$($pkg_config --libs ncurses)"
> fi
>
> if test "$curses" != "no" ; then
> @@ -2043,7 +2043,9 @@ int main(void) {
> return s != 0;
> }
> EOF
> + IFS=:
> for curses_lib in $curses_list; do
> + unset IFS
> if compile_prog "" "$curses_lib" ; then
> curses_found=yes
> libs_softmmu="$curses_lib $libs_softmmu"

