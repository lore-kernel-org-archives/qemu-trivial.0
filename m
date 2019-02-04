Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gqngE-0001cr-QC
	for mharc-qemu-trivial@gnu.org; Mon, 04 Feb 2019 18:29:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53756)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gqngD-0001bL-7E
	for qemu-trivial@nongnu.org; Mon, 04 Feb 2019 18:29:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gqngB-0008PM-3z
	for qemu-trivial@nongnu.org; Mon, 04 Feb 2019 18:29:33 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:40580)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gqng6-0008GA-Ue
	for qemu-trivial@nongnu.org; Mon, 04 Feb 2019 18:29:27 -0500
Received: by mail-wm1-f68.google.com with SMTP id f188so1753773wmf.5
	for <qemu-trivial@nongnu.org>; Mon, 04 Feb 2019 15:29:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=8aDKyKimHpXeL/8vwsDIEdUtWDO3BIsAbTTSDlVL0pc=;
	b=AkqDRzmi0c3Pciv2tPa7gT8CF7HL20OVMQtgtvE3K2PBFkKXpcBusVC50WjEXbIhJj
	0JZwFb1EbRSbWLGN3KAviSveQD5IJiRK0XK2G5eyTdcrWDRCeIkrkyoDwq2Ha7Dcgupg
	mriThiq9fd47/jgViFWuuKG/LnxgpOUZtiKV5SZXVbwdNcwj2WM1dt+qLFbgyvcxWTaf
	gzkczuGLzW9Qp/ogaDwz6e0GH7pkg8bkPaN+II14xJD8LwAgAFz65N3oD2D4QqJLnRY9
	7WDpT4dHtKp5GmMFI0eT2ueb/56xahQownuvc3/Y357YM/DE4ZrROO3O+KboS8m2/KDZ
	7lJw==
X-Gm-Message-State: AHQUAuayqv1wDcKOVWnA0a/MzTAujGabeIsSfhC24j+vG/Si5ewB5xcM
	bodoiVJV4jBpgLxYR/NLLbAtKA==
X-Google-Smtp-Source: AHgI3IaFCQkh39uPHQjKXNzlfhPEo+GJp7k737bPA9F5vkYySIc0AKQ6WMKmHPgImz7TB4CX/NqLoQ==
X-Received: by 2002:a1c:de57:: with SMTP id v84mr1231723wmg.55.1549322956590; 
	Mon, 04 Feb 2019 15:29:16 -0800 (PST)
Received: from [192.168.1.103] (10.red-83-35-153.dynamicip.rima-tde.net.
	[83.35.153.10]) by smtp.gmail.com with ESMTPSA id
	i186sm21028140wmd.19.2019.02.04.15.29.15
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Feb 2019 15:29:15 -0800 (PST)
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org
References: <20190204225542.5597-1-eblake@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <9a93a2a0-f352-1fb6-eb27-49f607cd0b97@redhat.com>
Date: Tue, 5 Feb 2019 00:29:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190204225542.5597-1-eblake@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.68
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] checkpatch: Flag
 suspicious attribution lines
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
X-List-Received-Date: Mon, 04 Feb 2019 23:29:34 -0000

On 2/4/19 11:55 PM, Eric Blake wrote:
> Flag commit attribution tags that are unusual (often because they
> were a typo), but only as a warning (because sometimes a humorous
> or otherwise useful tag is intentionally supplied).
> 
> This picks the 6-most popular tags, each with 700 or more uses (well,
> S-o-b was already checked for case-sensitivity and typos, leaving
> only 5 new tags being checked), as determined by:
> $ git log | sed -n 's/^ *\([A-Za-z-]*-by:\).*/\1/p' | \
>   sort | uniq -c | sort -k1,1n | tail
> 
> Most of the rejected lines were obvious typos (among others, we've
> had 4 cases of someone being burnt, based on Singed-off-by; and 2
> cases of list-reading via an e-reader, based on eviewed-by; there
> are also lines forgetting a space after the ':') or otherwise
> tongue-in-check (3 Approximately-suggested-by). A few lines not
> whitelisted here may be legitimate, but as they are orders of
> magnitude rarer, it is therefore not worth worrying about
> (7 Requested-by, 3 Co-authored-by, 1 Inspired-by, etc.).

'Inspired-by' is kinda Zen :) And is from Peter!

> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
> 
> v2: fix regex
> 
>  scripts/checkpatch.pl | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 88682cb0a9f..4962f74eec1 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -1456,7 +1456,7 @@ sub process {
>  		    ERROR("Author email address is mangled by the mailing list\n" . $herecurr);
>  		}
> 
> -#check the patch for a signoff:
> +#check the patch for a signoff, and that other attribution lines are typical:
>  		if ($line =~ /^\s*signed-off-by:/i) {
>  			# This is a signoff, if ugly, so do not double report.
>  			$signoff++;
> @@ -1470,6 +1470,10 @@ sub process {
>  				ERROR("space required after Signed-off-by:\n" .
>  					$herecurr);
>  			}
> +		} elsif($line =~ /^\s*([A-Za-z-]*)-by:/ &&

I guess we don't mind about angry typewriters who Ack-BY ;)

> +			($1 !~ /(Suggest|Report|Test|Ack|Review)ed/ ||
> +			 $line !~ /^\s*[a-z-]*-by:\s/i)) {

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> +		    WARN("suspicious attribution tag:\n" . $herecurr);
>  		}
> 
>  # Check if MAINTAINERS is being updated.  If so, there's probably no need to
> 

