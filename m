Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gzet8-0005Tu-IE
	for mharc-qemu-trivial@gnu.org; Fri, 01 Mar 2019 04:55:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41720)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sgarzare@redhat.com>) id 1gzet6-0005R2-Gf
	for qemu-trivial@nongnu.org; Fri, 01 Mar 2019 04:55:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sgarzare@redhat.com>) id 1gzet5-0004bh-Li
	for qemu-trivial@nongnu.org; Fri, 01 Mar 2019 04:55:28 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:35406)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sgarzare@redhat.com>) id 1gzet5-0004aW-EA
	for qemu-trivial@nongnu.org; Fri, 01 Mar 2019 04:55:27 -0500
Received: by mail-wr1-f67.google.com with SMTP id t18so25161114wrx.2
	for <qemu-trivial@nongnu.org>; Fri, 01 Mar 2019 01:55:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=yib+Tw0ecWSJR5iNenU+VFBiHb82Q5E0CMlv1gfP3gE=;
	b=L/RgWys/vrMVVKmQX+qOXhWJUxhT8MhNPPpHAy1kvu5MpMtE3BzUWTv01BslBe4JKe
	dKj+OgVEB3UOWOuVvnpTZ5WmMDcx3xOdkcu2hpymS5tVMnoR2k9YsnVvgfSXLd1VjVlz
	7qFb61Q7lMv9kCR6fnp9P3D4U+m9rnVZxtGhZOrinQVHvryy/+Znvf6BH3tHYGi8E8dR
	Pt3ORW3XIpcaLta1r3aIZadQeUY/2Shf322xsE2fOAFGZl6C7dmz4ZZfIdzxJ1oKLOLP
	53XCuvDJZCfQP5oPaXBpP9M1aaNDEAAHdwydJL0kMKCiV67IcyPORwTN5cyzI5TxnYWm
	5EnA==
X-Gm-Message-State: APjAAAWUXwmF4BHcrU/FtJYAoLDJtihzOD6JZXzDo8btU0ddWIAAGncW
	aQggc/ccKmvKDgDglbd8kDcfjA==
X-Google-Smtp-Source: APXvYqzoQJyC67tEC33gq0fIlymDsTvFQF9ZsbCPQN+qXcY4e+Gjw/VOTa06O/jVKstCv8NVpK36Zg==
X-Received: by 2002:adf:f80e:: with SMTP id s14mr2791090wrp.327.1551434125376; 
	Fri, 01 Mar 2019 01:55:25 -0800 (PST)
Received: from steredhat (host57-87-dynamic.30-79-r.retail.telecomitalia.it.
	[79.30.87.57]) by smtp.gmail.com with ESMTPSA id
	c67sm1175478wmd.47.2019.03.01.01.55.24
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 01 Mar 2019 01:55:24 -0800 (PST)
Date: Fri, 1 Mar 2019 10:55:22 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Wei Yang <richardw.yang@linux.intel.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	peter.maydell@linaro.org, philmd@redhat.com, mjt@tls.msk.ru,
	imammedo@redhat.com
Message-ID: <20190301095522.65dzdgcwq7ftk5wr@steredhat>
References: <20190301020147.18567-1-richardw.yang@linux.intel.com>
	<20190301020147.18567-2-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190301020147.18567-2-richardw.yang@linux.intel.com>
User-Agent: NeoMutt/20180716
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.67
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v5 1/2] CODING_STYLE:
 specify the indent rule for multiline code
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
X-List-Received-Date: Fri, 01 Mar 2019 09:55:29 -0000

On Fri, Mar 01, 2019 at 10:01:46AM +0800, Wei Yang wrote:
> We didn't specify the indent rule for multiline code here, which may
> mislead users. And in current code, the code use various styles.
> 
> Add this rule in CODING_STYLE to make sure this is clear to every one.
> 
> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
> Suggested-by: Igor Mammedov <imammedo@redhat.com>
> 
> ---
> v5:
>    * different rules -> various styles
>    * describe function variants separately
>    * take struct out
> v4:
>    * widths -> width
>    * add an exception example for function
> v3:
>    * misleading -> mislead
>    * add comma after arg2 in example
> v2:
>    * rephrase changelog suggested by Eric Blake
>      - remove one redundant line
>      - fix some awkward grammar
>      - add { ; at the end of example
> ---
>  CODING_STYLE | 39 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 
> diff --git a/CODING_STYLE b/CODING_STYLE
> index ec075dedc4..e175e6ea9a 100644
> --- a/CODING_STYLE
> +++ b/CODING_STYLE
> @@ -29,6 +29,45 @@ Spaces of course are superior to tabs because:
>  
>  Do not leave whitespace dangling off the ends of lines.
>  
> +1.1 Multiline Indent
> +
> +There are several places where indent is necessary:
> +
> + - if/else
> + - while/for
> + - function definition & call
> +
> +When breaking up a long line to fit within line width, we need a proper indent
> +for the following lines.
> +
> +In case of if/else, while/for, align the secondary lines just after the
> +opening parenthesis of the first.
> +
> +For example:
> +
> +    if (a == 1 &&
> +        b == 2) {
> +
> +    while (a == 1 &&
> +           b == 2) {
> +
> +In case of function, there are several variants:
> +
> +    * 4 spaces indent from the beginning
> +    * align the secondary lines just after the opening parenthesis of the
> +      first
> +
> +For example:
> +
> +    do_something(x, y,
> +        z);
> +
> +    do_something(x, y,
> +                 z);
> +
> +    do_something(x, do_another(y,
> +                               z);

Should we close another parenthesis after the "z"?

The rest LGTM!

Thanks,
Stefano

