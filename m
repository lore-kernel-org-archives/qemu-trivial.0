Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1duEar-0002uK-1r
	for mharc-qemu-trivial@gnu.org; Tue, 19 Sep 2017 05:13:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48255)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1duEap-0002tK-A8
	for qemu-trivial@nongnu.org; Tue, 19 Sep 2017 05:13:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1duEao-0007kU-G6
	for qemu-trivial@nongnu.org; Tue, 19 Sep 2017 05:13:23 -0400
Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241]:35249)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1duEak-0007gf-4G; Tue, 19 Sep 2017 05:13:18 -0400
Received: by mail-wm0-x241.google.com with SMTP id e64so3245981wmi.2;
	Tue, 19 Sep 2017 02:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=hDQgxs+fQh/GZOaX3zPYQWKmEa5AvGjTq2zjHpqiFUE=;
	b=CUhKpBprTt8uoq4uMh6q4wjeUMRyx0aCYgVBrM/sHvjKbEGmbRozjDc2FlvxgbeMwI
	6kQZR9VE7ojikrZpjJ+kTGTtMsCuOZJsxK6UpffpgpqJhpTzKELxygWZf6edb3S3XdfE
	j5Z6GFE6ldNfSg+Kcumt6DpCaK5s1Kr7B2YZCdWyfjfmuzLjiKSO6shdUOw5F2reiY/f
	mXkFh8TesGc29T/uIeHilLG2/R7p0h7Qm6ca+RCbahVm2EwzcAmbRPxf3pCRJ4OStu+y
	bhcUoDvXh/j0zNzVbmtrVcA2+XQ8bXUKDEY5kev0+AQZTKCkkeosleS+rIA8leDpTzG0
	23mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=hDQgxs+fQh/GZOaX3zPYQWKmEa5AvGjTq2zjHpqiFUE=;
	b=Ib2hH7BOqHRdyhkxpz2rUEPIhRqvecDp3QZZHh3B+NM+sxuOfo0+f3McZZvhOaCfLj
	nJf618HTMSNzXvWlwS3FuF1CN2uvIi04z6RtAIShlERITQ2O65TRzskQ8p7A7R6d9fEh
	n9bxntWQHqoxY9Fmei1wLOAr1qGkdybalbJqeWlquMeUAYpOL/eo2jgzQm65J77iQTjb
	9fo77EbIJO4MoUOeVXbypW7VVV4SQKYcY1qSYptJRljX0mulflSxHREAFRP0CbrO80OM
	Oi8G+F/mPk4eZVq6eZ8jQcT/whTn1TtD5wCupXfpzKRPerc0nCxJ9kwlJXcN64UlwiZ8
	t9Jw==
X-Gm-Message-State: AHPjjUjGhmEbsc2Jrh7sUoOy8BEbOTDld6BMMm6NmbHJsAmBrwirT8Hp
	BndrJGmnJEiN50oUrHzvBjI=
X-Google-Smtp-Source: AOwi7QCGUSh+4Gihti3ISiCzkhq5O208m1uGZJw0l+lSVVN7t80pqf9KcAPMl7qq1P/dawGPorGllg==
X-Received: by 10.28.216.75 with SMTP id p72mr481236wmg.128.1505812397128;
	Tue, 19 Sep 2017 02:13:17 -0700 (PDT)
Received: from localhost (33.59.7.51.dyn.plus.net. [51.7.59.33])
	by smtp.gmail.com with ESMTPSA id k18sm903453wmd.22.2017.09.19.02.13.15
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 19 Sep 2017 02:13:16 -0700 (PDT)
Date: Tue, 19 Sep 2017 10:13:04 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	"open list:Network Block Dev..." <qemu-block@nongnu.org>,
	Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>
Message-ID: <20170919091304.GA22797@stefanha-x1.localdomain>
References: <20170918214649.17550-1-eblake@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170918214649.17550-1-eblake@redhat.com>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::241
Subject: Re: [Qemu-trivial] [Qemu-block] [PATCH] nbd-client: Use correct
 macro parenthesization
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
X-List-Received-Date: Tue, 19 Sep 2017 09:13:24 -0000

On Mon, Sep 18, 2017 at 04:46:49PM -0500, Eric Blake wrote:
> If 'bs' is a complex expression, we were only casting the front half
> rather than the full expression.  Luckily, none of the callers were
> passing bad arguments, but it's better to be robust up front.
> 
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
> 
> I plan to take this through my NBD queue, unless it is picked up
> by qemu-trivial first...
> 
>  block/nbd-client.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

