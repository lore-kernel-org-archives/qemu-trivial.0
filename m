Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h0iVy-0002Op-Uu
	for mharc-qemu-trivial@gnu.org; Mon, 04 Mar 2019 02:59:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52881)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sgarzare@redhat.com>) id 1h0iVx-0002Mk-3B
	for qemu-trivial@nongnu.org; Mon, 04 Mar 2019 02:59:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sgarzare@redhat.com>) id 1h0iVw-0004zq-Bq
	for qemu-trivial@nongnu.org; Mon, 04 Mar 2019 02:59:57 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:42040)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sgarzare@redhat.com>) id 1h0iVw-0004xr-6G
	for qemu-trivial@nongnu.org; Mon, 04 Mar 2019 02:59:56 -0500
Received: by mail-wr1-f66.google.com with SMTP id r5so4361095wrg.9
	for <qemu-trivial@nongnu.org>; Sun, 03 Mar 2019 23:59:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=4R8QirbnIkQfpvdupt0DA6TDSAEwkLZDZMrvGeoLg8c=;
	b=i0vPIiNJAG3LGFI9MVOXyzewgFolxqhmtMl68Dpa19IA/HBfSje0cdNpoGKeVLpS9H
	kxDZIiV8Da7GkMJIb6TEJGi1hY4UJBHL1kDMfbhJGHuRn9KF0hbXU2uRq+tsxAe23ehO
	zEd7eYqhkw3ozh4KRLOj4eEmTFcJA+lhxbjZtXQHgealZTsYruAwd6kStGNhR0AKOuoE
	ICI0TC6yAmCTllDIGWv6DzG6ZDOXiH2ROeumADi3g6qq/L7t7nf7wzI8w8kRSSfNtScy
	kDZbJxKc7guYivAs3W4kJNdnnPLzIoMb4Xkdg9TFBik8F3sK5O3jf9k5g/dL69xH7DFO
	QRIA==
X-Gm-Message-State: APjAAAWTsliCm510S3AEfQ3RRSOiExxf1CzZBXKGl92dItE+2iPMyhBo
	XHLRcq30H0VpcaluYvlpvGtkTA==
X-Google-Smtp-Source: APXvYqwdv2q1qlG0+MmTuCTv8A4mwC6wmXS+7nwVKhlL7uzN34kFVxnt4keFvgv2pmjGgcWywz5XEg==
X-Received: by 2002:a5d:5544:: with SMTP id g4mr11336062wrw.269.1551686393929; 
	Sun, 03 Mar 2019 23:59:53 -0800 (PST)
Received: from steredhat (host114-14-dynamic.30-79-r.retail.telecomitalia.it.
	[79.30.14.114]) by smtp.gmail.com with ESMTPSA id
	w12sm5051337wrr.67.2019.03.03.23.59.52
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 03 Mar 2019 23:59:53 -0800 (PST)
Date: Mon, 4 Mar 2019 08:59:45 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Wei Yang <richardw.yang@linux.intel.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, mjt@tls.msk.ru,
	imammedo@redhat.com, philmd@redhat.com, eblake@redhat.com,
	peter.maydell@linaro.org
Message-ID: <20190304075945.hx3t7ylwssnlkvad@steredhat>
References: <20190304071631.27567-1-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190304071631.27567-1-richardw.yang@linux.intel.com>
User-Agent: NeoMutt/20180716
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.66
Subject: Re: [Qemu-trivial] [PATCH v6 0/2] CODING_STYLE: trivial update
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
X-List-Received-Date: Mon, 04 Mar 2019 07:59:57 -0000

On Mon, Mar 04, 2019 at 03:16:29PM +0800, Wei Yang wrote:
> The first one is suggested by Igor Mammedov to provide rule for multiline
> code.
> 
> The second is a trivial fix to make example code all indented with 4 spaces.
> 
> v6:
>   * add ) for last example of function
> v5:
>   * mostly address function variants
> v4:
>   * one exception case for function
> v3:
>   * fix typo in both changelog and example
> v2:
>   * adjust Patch 1 as suggested by Eric
> 
> Wei Yang (2):
>   CODING_STYLE: specify the indent rule for multiline code
>   CODING_STYLE: indent example code as all others
> 
>  CODING_STYLE | 47 +++++++++++++++++++++++++++++++++++++++++++----
>  1 file changed, 43 insertions(+), 4 deletions(-)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

Thanks,
Stefano

