Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1f9FgR-0001JE-6T
	for mharc-qemu-trivial@gnu.org; Thu, 19 Apr 2018 15:57:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60622)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1f9FgO-0001Gk-KP
	for qemu-trivial@nongnu.org; Thu, 19 Apr 2018 15:57:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1f9FgN-0003Ev-Tq
	for qemu-trivial@nongnu.org; Thu, 19 Apr 2018 15:57:28 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:38696 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1f9FgI-0003AR-Nh; Thu, 19 Apr 2018 15:57:22 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3CAF981A88BD;
	Thu, 19 Apr 2018 19:57:22 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-151.ams2.redhat.com
	[10.36.117.151])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D5E3C2166BAE;
	Thu, 19 Apr 2018 19:57:21 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 0B4EA40DC8; Thu, 19 Apr 2018 21:57:21 +0200 (CEST)
Date: Thu, 19 Apr 2018 21:57:21 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
	Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20180419195721.r3salb5hd3w2plr4@sirius.home.kraxel.org>
References: <20180419132026.5494-1-kraxel@redhat.com>
	<20180419132026.5494-2-kraxel@redhat.com>
	<8fc65111-4c2f-9e07-3e4a-c95a6d52b29f@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8fc65111-4c2f-9e07-3e4a-c95a6d52b29f@redhat.com>
User-Agent: NeoMutt/20180323
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Thu, 19 Apr 2018 19:57:22 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Thu, 19 Apr 2018 19:57:22 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'kraxel@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/4] ui: add qapi parser for
 -display
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
X-List-Received-Date: Thu, 19 Apr 2018 19:57:29 -0000

> > +    /*
> > +     * We don't have any dynamically allocated stuff inside
> > +     * DisplayOptions, so we can simply copy the struct content and
> > +     * free opts without ending up with pointers pointing into
> > +     * nowhere.
> > +     */
> > +    dpy = *opts;
> > +    qapi_free_DisplayOptions(opts);
> 
> That's risky; would it be better to use QAPI_CLONE_MEMBERS() to not have
> to worry about if we add a pointer in the future?

Didn't know QAPI_CLONE_MEMBERS() exists.  Yes, probably more
future-proof to just use that instead of adding that comment.
Will look into that for v2.

cheers,
  Gerd


