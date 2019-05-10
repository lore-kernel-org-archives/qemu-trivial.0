Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hP0QH-0005Eb-Qv
	for mharc-qemu-trivial@gnu.org; Fri, 10 May 2019 03:58:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54983)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sgarzare@redhat.com>) id 1hP0QF-0005EK-R5
	for qemu-trivial@nongnu.org; Fri, 10 May 2019 03:58:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sgarzare@redhat.com>) id 1hP0QE-0000QV-Po
	for qemu-trivial@nongnu.org; Fri, 10 May 2019 03:58:27 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:32926)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sgarzare@redhat.com>) id 1hP0QE-0000Pw-JD
	for qemu-trivial@nongnu.org; Fri, 10 May 2019 03:58:26 -0400
Received: by mail-wm1-f67.google.com with SMTP id c66so716101wme.0
	for <qemu-trivial@nongnu.org>; Fri, 10 May 2019 00:58:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=PZFZyLTwwZF9KVviz+T8UozFNuQHGICocSf+qqE6fVw=;
	b=VDOjTEuJBLNnj9RkygVFGB8JZHQfG2KZe2usNxYtaSgf/1qrNI8q1yZKCN1OcgQc6X
	a4PCvijo/3JCtiiGQYsUNNxCHzNVg9Q4S2UWSbgyF5DKB1a1UJYkZUad+UsHYn3m/H1k
	L7HaA9T/tMruOvAIE97ks1EJ11aohH2SxvpWTpD/9qDhPP88g+ffkhUAYCJAbieKHtWD
	uPVz44znZHGMof+K6VitR9cZnr07cuBS+v8nOLovEH9/g94HC2vUPFD17k2mXLhNDL6c
	wDuFyUcZDyRNnF4hYzoAJmkCOIfcAMoQgqrFUGIACwGKIY8bfz9Y1WSOXC6LXx0rn+h9
	pckg==
X-Gm-Message-State: APjAAAWRXrf4w0Rtyn8U8/86I26ruFnpRPSoR8XciSJ9rw8eH5nD1TQ4
	SRwIIZlhYeUtSmpqayKYyXTu4w==
X-Google-Smtp-Source: APXvYqzgyco0+YgwnuX9FzZN2dxe1W6zSFEnqiONtTHwPVtEyc2s/ffbFB5iLbcJfh/T9N18eN3SfA==
X-Received: by 2002:a1c:f312:: with SMTP id q18mr5824391wmq.96.1557475105489; 
	Fri, 10 May 2019 00:58:25 -0700 (PDT)
Received: from steredhat (host151-251-static.12-87-b.business.telecomitalia.it.
	[87.12.251.151]) by smtp.gmail.com with ESMTPSA id
	s11sm13176231wrb.71.2019.05.10.00.58.24
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 10 May 2019 00:58:24 -0700 (PDT)
Date: Fri, 10 May 2019 09:58:21 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-trivial@nongnu.org, Jan Kiszka <jan.kiszka@siemens.com>,
	Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
	Samuel Thibault <samuel.thibault@ens-lyon.org>
Message-ID: <20190510075821.v2vvcvrb2ofptvi6@steredhat>
References: <20190509133737.242548-1-sgarzare@redhat.com>
	<87y33f1xw4.fsf@dusky.pond.sub.org>
	<20190509151636.xcon4rt7ybdo32pz@steredhat>
	<87h8a2x36o.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87h8a2x36o.fsf@dusky.pond.sub.org>
User-Agent: NeoMutt/20180716
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.67
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
X-List-Received-Date: Fri, 10 May 2019 07:58:28 -0000

On Fri, May 10, 2019 at 07:56:47AM +0200, Markus Armbruster wrote:
> Stefano Garzarella <sgarzare@redhat.com> writes:
> 
> > On Thu, May 09, 2019 at 04:54:35PM +0200, Markus Armbruster wrote:
> >> Stefano Garzarella <sgarzare@redhat.com> writes:
> >> 
> >> > Add a missing parentheses at the end of the error message,
> >> > when we have an invalid prefix len.
> >> >
> >> > Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> >> > ---
> >> >  net/slirp.c | 3 ++-
> >> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >> >
> >> > diff --git a/net/slirp.c b/net/slirp.c
> >> > index 95934fb36d..0f4ae0abc0 100644
> >> > --- a/net/slirp.c
> >> > +++ b/net/slirp.c
> >> > @@ -498,7 +498,8 @@ static int net_slirp_init(NetClientState *peer, const char *model,
> >> >      }
> >> >      if (vprefix6_len < 0 || vprefix6_len > 126) {
> >> >          error_setg(errp,
> >> > -                   "Invalid prefix provided (prefix len must be in range 0-126");
> >> > +                   "Invalid prefix provided "
> >> > +                   "(prefix len must be in range 0-126)");
> >> >          return -1;
> >> >      }
> >> 
> >> Preexisting: the error message fails to identify the offending
> >> parameter.  The user needs to make the connection to "ipv6-prefixlen"
> >> based on the fact that the only parameters with "prefix" in name or
> >> description are "ipv6-prefix" and "ipv6-prefixlen", and only the latter
> >> is a length.
> >> 
> >> What about "Parameter 'ipv6-prefixlen' expects a length below 127", or
> >> "Parameter 'ipv6-prefixlen' expects a value between 0 and 126"?
> >
> > "Parameter 'ipv6-prefixlen' expects a value between 0 and 126" should be
> > fine.
> >
> > Otherwise, since other errors didn't refer to the parameter name, we can
> > simply add IPv6 in this way:
> > "Invalid IPv6 prefix provided (IPv6 prefix len must be between 0 and 126)"
> 
> "len" is not a word.  Either say "ipv6-prefixlen", or say "IPv6 prefix
> length".
> 
> > But I'm fine also with your proposal.
> 
> It's just a suggestion.  Feel free to leave the error messages
> consistently vague (apply your patch as is), improve just this one, or
> improve more messages.

Your suggestions are very appreciated!

I'll resend this patch fixing this error message and I'll check also
the other messages.

Thanks,
Stefano

