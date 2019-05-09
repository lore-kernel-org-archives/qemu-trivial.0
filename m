Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hOkmt-0003OA-TD
	for mharc-qemu-trivial@gnu.org; Thu, 09 May 2019 11:16:47 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45735)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sgarzare@redhat.com>) id 1hOkmn-0003Mc-Si
	for qemu-trivial@nongnu.org; Thu, 09 May 2019 11:16:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sgarzare@redhat.com>) id 1hOkmm-0003jO-Vd
	for qemu-trivial@nongnu.org; Thu, 09 May 2019 11:16:41 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:34194)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sgarzare@redhat.com>) id 1hOkmm-0003hq-OB
	for qemu-trivial@nongnu.org; Thu, 09 May 2019 11:16:40 -0400
Received: by mail-wr1-f68.google.com with SMTP id f7so3617620wrq.1
	for <qemu-trivial@nongnu.org>; Thu, 09 May 2019 08:16:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=Qv21UG6PYs6XfxcKFP3vb31xomhEI8qGAEW0Lzkhx7o=;
	b=t7rMoGjDwHMG510QHWeqMfIwS6oqqF5ahAZAOz2JbU1bQhzZJDF7SOsJF4BfWO9hOc
	doAe/D7+GED76EAn8+yc3qi1mYQZ0UtJ7chQpi4/r8bH8x8w40Zcv3k/Zm0Xz7OjYRY5
	tuovTpYEGisYnw9Ac3dy0u7eQG4nU0l5JNZPB4LCn661yLpPuHYYmJ4d+ZeKlH8cYDwm
	qeTqWol4p5NhZr9aBXvI12q2A+IE7p/eQmIvCoN1hBsBl4MZnM2Lo0qBxHgNUkwqa4dM
	0odPXaDWVoWWl7jvqcbQuvoPDRb2ehvybrN+PZBJMQvEM+2Y73DcVkFTJJ/2KHKjqYvj
	3sSw==
X-Gm-Message-State: APjAAAWSrD9wu9g8+INQFRRlaiLIN9X/VlZUtyVEDtf5wp6frZ78Dy7C
	aNug9O5KnS+1LiBAuuMXYxnelw==
X-Google-Smtp-Source: APXvYqzzqS5lDB6na5PrI+thN3kmicuan3RYFlTdCFpIbyPZX5iVs4+9ryLMuxmkKoDlerLFPGXEqQ==
X-Received: by 2002:a5d:4111:: with SMTP id l17mr3559227wrp.242.1557414999488; 
	Thu, 09 May 2019 08:16:39 -0700 (PDT)
Received: from steredhat (host151-251-static.12-87-b.business.telecomitalia.it.
	[87.12.251.151]) by smtp.gmail.com with ESMTPSA id
	q24sm1604065wmc.18.2019.05.09.08.16.38
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 09 May 2019 08:16:38 -0700 (PDT)
Date: Thu, 9 May 2019 17:16:36 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Jan Kiszka <jan.kiszka@siemens.com>, Jason Wang <jasowang@redhat.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>
Message-ID: <20190509151636.xcon4rt7ybdo32pz@steredhat>
References: <20190509133737.242548-1-sgarzare@redhat.com>
	<87y33f1xw4.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87y33f1xw4.fsf@dusky.pond.sub.org>
User-Agent: NeoMutt/20180716
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.68
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] net/slirp: fix the error
 message when the prefix len is invalid
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
X-List-Received-Date: Thu, 09 May 2019 15:16:42 -0000

On Thu, May 09, 2019 at 04:54:35PM +0200, Markus Armbruster wrote:
> Stefano Garzarella <sgarzare@redhat.com> writes:
> 
> > Add a missing parentheses at the end of the error message,
> > when we have an invalid prefix len.
> >
> > Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> > ---
> >  net/slirp.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/net/slirp.c b/net/slirp.c
> > index 95934fb36d..0f4ae0abc0 100644
> > --- a/net/slirp.c
> > +++ b/net/slirp.c
> > @@ -498,7 +498,8 @@ static int net_slirp_init(NetClientState *peer, const char *model,
> >      }
> >      if (vprefix6_len < 0 || vprefix6_len > 126) {
> >          error_setg(errp,
> > -                   "Invalid prefix provided (prefix len must be in range 0-126");
> > +                   "Invalid prefix provided "
> > +                   "(prefix len must be in range 0-126)");
> >          return -1;
> >      }
> 
> Preexisting: the error message fails to identify the offending
> parameter.  The user needs to make the connection to "ipv6-prefixlen"
> based on the fact that the only parameters with "prefix" in name or
> description are "ipv6-prefix" and "ipv6-prefixlen", and only the latter
> is a length.
> 
> What about "Parameter 'ipv6-prefixlen' expects a length below 127", or
> "Parameter 'ipv6-prefixlen' expects a value between 0 and 126"?

"Parameter 'ipv6-prefixlen' expects a value between 0 and 126" should be
fine.

Otherwise, since other errors didn't refer to the parameter name, we can
simply add IPv6 in this way:
"Invalid IPv6 prefix provided (IPv6 prefix len must be between 0 and 126)"

But I'm fine also with your proposal.

Thanks,
Stefano

