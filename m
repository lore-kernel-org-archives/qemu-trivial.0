Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hQtWy-0004Zw-LG
	for mharc-qemu-trivial@gnu.org; Wed, 15 May 2019 09:01:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38211)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sgarzare@redhat.com>) id 1hQtWx-0004Zl-CP
	for qemu-trivial@nongnu.org; Wed, 15 May 2019 09:01:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sgarzare@redhat.com>) id 1hQtWw-0007CV-BX
	for qemu-trivial@nongnu.org; Wed, 15 May 2019 09:01:11 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:36313)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sgarzare@redhat.com>) id 1hQtWw-0007BS-53
	for qemu-trivial@nongnu.org; Wed, 15 May 2019 09:01:10 -0400
Received: by mail-wm1-f66.google.com with SMTP id j187so2406702wmj.1
	for <qemu-trivial@nongnu.org>; Wed, 15 May 2019 06:01:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=YbhfH9nn7lcnNo7iVuw9vm+oRfYBEau4tD6FtClKqoI=;
	b=reQtgb0pEKFfHxmnCCad8fkduNwDUCu0nrAKlXuZK2B0WjwE2YYsSncrRJDfrVbl3q
	NVy4QYQiHu+lmWNz7hbSzZKBF4TmtiPvJ+vrLlnwtNGhr4hxDJqI7UkP3hxrlqsnG45X
	UcnCnCvaqeAIxIDy/Rj0dX0btEaYIaqm51FpwD0yfibp0zYDM+6IqF0cD6SJK1Qmramh
	9Y22D02sdLn34GXTtwjCC3RUSaof/iOqtDGF5TYEGgm2cg0qAUKw1nKNaJ3b+SuuA6lu
	8BbQkfjf7XLTp2VgaVZJ55i49GvsmoH4OV5/53iZ8i3omUnOOjzM3pWuGTCrWb44lyA/
	QzgQ==
X-Gm-Message-State: APjAAAWACaDbskHuG8GuGuWjuidQKbqCfUvWK9YT1+Usvr2W74ElTWik
	MwlRlUYDfZW+tnlyaYQCYn2OxQ==
X-Google-Smtp-Source: APXvYqyvmvYqFdr7+kgYZQ5Eof+hNosyjOiWg3Thol6A7qy3jx2AJlsh5fekyur20ZISKIBMsOztPg==
X-Received: by 2002:a1c:7a12:: with SMTP id v18mr7718965wmc.69.1557925268965; 
	Wed, 15 May 2019 06:01:08 -0700 (PDT)
Received: from steredhat (host151-251-static.12-87-b.business.telecomitalia.it.
	[87.12.251.151])
	by smtp.gmail.com with ESMTPSA id x6sm2829342wru.36.2019.05.15.06.01.07
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 15 May 2019 06:01:08 -0700 (PDT)
Date: Wed, 15 May 2019 15:01:00 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Jan Kiszka <jan.kiszka@siemens.com>, Jason Wang <jasowang@redhat.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	=?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Message-ID: <20190515130100.rth7dnluusk75v23@steredhat>
References: <20190515090805.44785-1-sgarzare@redhat.com>
	<875zqb7v9c.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <875zqb7v9c.fsf@dusky.pond.sub.org>
User-Agent: NeoMutt/20180716
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.66
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] net/slirp: fix the IPv6
 prefix length error message
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
X-List-Received-Date: Wed, 15 May 2019 13:01:12 -0000

On Wed, May 15, 2019 at 02:33:03PM +0200, Markus Armbruster wrote:
> Stefano Garzarella <sgarzare@redhat.com> writes:
> 
> > Reword and add a missing parentheses at the end of the
> > error message.
> >
> > Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> > Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> > ---
> > v2:
> >   - Reworded the error message (Markus)
> >   - Added Marc-André's R-b
> >     I made a little change to the error message, let me now
> >     if I should remove yuor R-b.
> > ---
> >  net/slirp.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/net/slirp.c b/net/slirp.c
> > index 95934fb36d..b34cb29276 100644
> > --- a/net/slirp.c
> > +++ b/net/slirp.c
> > @@ -498,7 +498,8 @@ static int net_slirp_init(NetClientState *peer, const char *model,
> >      }
> >      if (vprefix6_len < 0 || vprefix6_len > 126) {
> >          error_setg(errp,
> > -                   "Invalid prefix provided (prefix len must be in range 0-126");
> > +                   "Invalid IPv6 prefix provided "
> > +                   "(IPv6 prefix length must be between 0 and 126)");
> >          return -1;
> >      }
> 
> "Parameter 'ipv6-prefixlen' expects a value between 0 and 126" would be
> closer to how we report similar errors elsewhere.

This error is shown when 'ipv6-net' or 'ipv6-prefixlen' parameters are
used, so I preferred to leave a more generic error to fit both cases.

> 
> Regardless:
> Reviewed-by: Markus Armbruster <armbru@redhat.com>

Thanks,
Stefano

