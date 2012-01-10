Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RkXhm-0004iT-EM
	for mharc-qemu-trivial@gnu.org; Tue, 10 Jan 2012 04:09:18 -0500
Received: from eggs.gnu.org ([140.186.70.92]:51066)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RkXhf-0004fK-Th
	for qemu-trivial@nongnu.org; Tue, 10 Jan 2012 04:09:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RkXhb-0001zj-Sy
	for qemu-trivial@nongnu.org; Tue, 10 Jan 2012 04:09:11 -0500
Received: from mail-ey0-f173.google.com ([209.85.215.173]:36580)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1RkXhS-0001yW-ML; Tue, 10 Jan 2012 04:08:58 -0500
Received: by eaad1 with SMTP id d1so2590258eaa.4
	for <multiple recipients>; Tue, 10 Jan 2012 01:08:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=vryYolGSEbkondphiXjyIyH7soyvXa0WpTj62TPeJxk=;
	b=bRAXpwO59YQytFDUJCPkfQXq0fvux0OMwlVwQg3AFKMhR1HiciMeaxxUo7JpAgnTT6
	V2Lb7UWPoPIUonZ5oD5qlauxeIoetxW3rKWtOSQXIOgSr7oB3AbIMcQQlIREe3v+Bmca
	KwkYbTa8dHIIUbji1L0HIIYz4KPMSeqVEYWC8=
Received: by 10.213.35.209 with SMTP id q17mr3849781ebd.144.1326186537092;
	Tue, 10 Jan 2012 01:08:57 -0800 (PST)
Received: from localhost (gbibp9ph1--blueice3n2.emea.ibm.com. [195.212.29.84])
	by mx.google.com with ESMTPS id
	b49sm270814923eec.9.2012.01.10.01.08.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 Jan 2012 01:08:56 -0800 (PST)
Date: Tue, 10 Jan 2012 08:35:55 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20120110083555.GA13145@stefanha-thinkpad.localdomain>
References: <1326130191-20344-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1326130191-20344-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.215.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] Add 'fall through' comments to case
 statements without break
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
X-List-Received-Date: Tue, 10 Jan 2012 09:09:17 -0000

On Mon, Jan 09, 2012 at 06:29:51PM +0100, Stefan Weil wrote:
> These comments are used by static code analysis tools and in code reviews
> to avoid false warnings because of missing break statements.
> 
> The case statements handled here were reported by coverity.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  hw/pcnet.c    |    1 +
>  json-lexer.c  |    1 +
>  qemu-option.c |    4 ++++
>  3 files changed, 6 insertions(+), 0 deletions(-)

This reminds me of another questionable fall-through:

bt-host.c:bt_host_read():

while (s->len --)
    switch (*pkt ++) {
    ...
    case HCI_SCODATA_PKT:
        if (s->len < 3)
            goto bad_pkt;

        pktlen = MIN(pkt[2] + 3, s->len);
        s->len -= pktlen;
        pkt += pktlen;
                             <--- fall-through or not?
    default:
    bad_pkt:
        fprintf(stderr, "qemu: bad HCI packet type %02x\n", pkt[-1]);
    }

It seems the code will skip HCI_SCODATA_PKT and report a warning (although type
pkt[-1] will be incorrect).  Any thoughts?

Stefan

