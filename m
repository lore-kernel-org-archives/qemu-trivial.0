Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d3qyn-00007a-62
	for mharc-qemu-trivial@gnu.org; Thu, 27 Apr 2017 17:29:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36729)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d3qyl-00007S-8L
	for qemu-trivial@nongnu.org; Thu, 27 Apr 2017 17:29:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d3qyh-0000sX-E4
	for qemu-trivial@nongnu.org; Thu, 27 Apr 2017 17:29:35 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:35955)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d3qyh-0000ry-8e; Thu, 27 Apr 2017 17:29:31 -0400
Received: by mail-qk0-x243.google.com with SMTP id y63so6576614qkd.3;
	Thu, 27 Apr 2017 14:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=uEL+X9JHOUuQlxDo0K3LacacQ9NmrcGzokthCeSwU3c=;
	b=Lf+pC47P4h0ZCcZL7rAzoRVSucRfBSOcECyE16i7CH4HaLNWhm3OWBBt8CMxOaye+9
	kJKqtPOCdH/d3wN7l+tER4HWp6JuHCOJ4TGAShCXR+Bc2IwOhvA1mxYsFcULitQmpl8F
	OZ/aaW5Xhz0Yl97PwYqL9xdjLfQR82loUod3B2u8ApTLapRECdrxH7PZcaCgLeJlF8jr
	xYBOFav4wFFiuIhcNtUnhG43B6FbpYOpfcKsCSPtLR+Tv6IonLN2sv6fQziKDhLjIBAL
	ZLGAzWrq9zab2Ibmm6zjQpgy9FZRh1utlkRnGV9suPZYFqqX2jycwmbSfm+IM/VFgpdE
	YldA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=uEL+X9JHOUuQlxDo0K3LacacQ9NmrcGzokthCeSwU3c=;
	b=PVAPCJBPHl17rIKY0YsM25kOHvS1xMgwT9fBA0OGfAt8Pf+9EgY/2L8SqS8ug5JAME
	IQvDmaSFBMfPsQQWUTzNYheTu2x29jDC29slPE1yr8BPLs9WHhYl8zhsDfwKw6LrDHxp
	7sz5pY8cjMyI8v/o5UIIdYfW8P51rL/+Ngl774s8YxBYi3vmoVEvQlGsw+eZ+qqfoRWD
	IUkv/MC9J0kXjmgRc66ky/6BSNXGQ2Eb1uq3C/ZyE1vyPVIt6f8YDQwojPEDEw3vPp8U
	wW9f9vdHsZAQngDhWqHjgYtZT3CXSVyJu7byxo77tysDu9zdb55rZyD8VgPDsuf61OnX
	rQFw==
X-Gm-Message-State: AN3rC/73AL/LTCJYaH+jxRr8saM5uPHAW1f+FGye25gyL4p+CUVV2kaY
	Jq+WZeVgHTic+A==
X-Received: by 10.55.78.201 with SMTP id c192mr7365228qkb.81.1493328570455;
	Thu, 27 Apr 2017 14:29:30 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id
	s32sm2422330qtc.62.2017.04.27.14.29.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Apr 2017 14:29:29 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Kamil Rytarowski <n54@gmx.com>, qemu-devel@nongnu.org
References: <20170426115826.1826-1-n54@gmx.com>
	<20170426131604.3459-1-n54@gmx.com>
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org, armbru@redhat.com
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <c0cfe913-ca69-5e96-b2c8-71117df8fef9@amsat.org>
Date: Thu, 27 Apr 2017 18:29:27 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170426131604.3459-1-n54@gmx.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] scripts: Switch to more
 portable Perl shebang
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
X-List-Received-Date: Thu, 27 Apr 2017 21:29:36 -0000

On 04/26/2017 10:16 AM, Kamil Rytarowski wrote:
> The default NetBSD package manager is pkgsrc and it installs Perl
> along other third party programs under custom and configurable prefix.
> The default prefix for binary prebuilt packages is /usr/pkg, and the
> Perl executable lands in /usr/pkg/bin/perl.
>
> This change switches "/usr/bin/perl" to "/usr/bin/env perl" as it's
> the most portable solution that should work for almost everybody.
> Perl's executable is detected automatically.
>
> This change switches -w option passed to the executable with more
> modern "use warnings;" approach. There is no functional change to the
> default behavior.
>
> Signed-off-by: Kamil Rytarowski <n54@gmx.com>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  scripts/checkpatch.pl           | 3 ++-
>  scripts/clean-header-guards.pl  | 3 ++-
>  scripts/cleanup-trace-events.pl | 2 +-
>  scripts/disas-objdump.pl        | 4 +++-
>  scripts/get_maintainer.pl       | 3 ++-
>  scripts/shaderinclude.pl        | 2 +-
>  scripts/switch-timer-api        | 2 +-
>  scripts/texi2pod.pl             | 4 +++-
>  8 files changed, 15 insertions(+), 8 deletions(-)
>
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index f084542934..3bb6fc95bd 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -1,4 +1,4 @@
> -#!/usr/bin/perl -w
> +#!/usr/bin/env perl
>  # (c) 2001, Dave Jones. (the file handling bit)
>  # (c) 2005, Joel Schopp <jschopp@austin.ibm.com> (the ugly bit)
>  # (c) 2007,2008, Andy Whitcroft <apw@uk.ibm.com> (new conditions, test suite)
> @@ -6,6 +6,7 @@
>  # Licensed under the terms of the GNU GPL License version 2
>
>  use strict;
> +use warnings;
>
>  my $P = $0;
>  $P =~ s@.*/@@g;
> diff --git a/scripts/clean-header-guards.pl b/scripts/clean-header-guards.pl
> index 54ab99ae29..5e67f1998c 100755
> --- a/scripts/clean-header-guards.pl
> +++ b/scripts/clean-header-guards.pl
> @@ -1,4 +1,4 @@
> -#!/usr/bin/perl -w
> +#!/usr/bin/env perl
>  #
>  # Clean up include guards in headers
>  #
> @@ -28,6 +28,7 @@
>  #   "cc -E -DGUARD_H -c -P -", and fed the test program on stdin.
>
>  use strict;
> +use warnings;
>  use Getopt::Std;
>
>  # Stuff we don't want to clean because we import it into our tree:
> diff --git a/scripts/cleanup-trace-events.pl b/scripts/cleanup-trace-events.pl
> index 7e808efb6a..e93abc00da 100755
> --- a/scripts/cleanup-trace-events.pl
> +++ b/scripts/cleanup-trace-events.pl
> @@ -1,4 +1,4 @@
> -#!/usr/bin/perl
> +#!/usr/bin/env perl
>  # Copyright (C) 2013 Red Hat, Inc.
>  #
>  # Authors:
> diff --git a/scripts/disas-objdump.pl b/scripts/disas-objdump.pl
> index 8f7e8182a1..bec905f04b 100755
> --- a/scripts/disas-objdump.pl
> +++ b/scripts/disas-objdump.pl
> @@ -1,4 +1,6 @@
> -#!/usr/bin/perl -w
> +#!/usr/bin/env perl
> +
> +use warnings;
>
>  use File::Temp qw/ tempfile /;
>  use Getopt::Long;
> diff --git a/scripts/get_maintainer.pl b/scripts/get_maintainer.pl
> index 8261bcb1ad..d7c2311123 100755
> --- a/scripts/get_maintainer.pl
> +++ b/scripts/get_maintainer.pl
> @@ -1,4 +1,4 @@
> -#!/usr/bin/perl -w
> +#!/usr/bin/env perl
>  # (c) 2007, Joe Perches <joe@perches.com>
>  #           created from checkpatch.pl
>  #
> @@ -11,6 +11,7 @@
>  # Licensed under the terms of the GNU GPL License version 2
>
>  use strict;
> +use warnings;
>
>  my $P = $0;
>  my $V = '0.26';
> diff --git a/scripts/shaderinclude.pl b/scripts/shaderinclude.pl
> index 81b5146332..cd3bb40b12 100644
> --- a/scripts/shaderinclude.pl
> +++ b/scripts/shaderinclude.pl
> @@ -1,4 +1,4 @@
> -#!/usr/bin/perl
> +#!/usr/bin/env perl
>  use strict;
>  use warnings;
>
> diff --git a/scripts/switch-timer-api b/scripts/switch-timer-api
> index b0e230b9f1..41736d11dd 100755
> --- a/scripts/switch-timer-api
> +++ b/scripts/switch-timer-api
> @@ -1,4 +1,4 @@
> -#!/usr/bin/perl
> +#!/usr/bin/env perl
>
>  use strict;
>  use warnings;
> diff --git a/scripts/texi2pod.pl b/scripts/texi2pod.pl
> index 6e8fec41a1..39ce584a32 100755
> --- a/scripts/texi2pod.pl
> +++ b/scripts/texi2pod.pl
> @@ -1,4 +1,4 @@
> -#! /usr/bin/perl -w
> +#! /usr/bin/env perl
>
>  #   Copyright (C) 1999, 2000, 2001, 2003 Free Software Foundation, Inc.
>
> @@ -22,6 +22,8 @@
>  # markup to Perl POD format.  It's intended to be used to extract
>  # something suitable for a manpage from a Texinfo document.
>
> +use warnings;
> +
>  $output = 0;
>  $skipping = 0;
>  %sects = ();
>

