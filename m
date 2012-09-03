Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T8aq5-0004I5-Pn
	for mharc-qemu-trivial@gnu.org; Mon, 03 Sep 2012 13:53:33 -0400
Received: from eggs.gnu.org ([208.118.235.92]:46413)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1T8aq0-0004H3-07
	for qemu-trivial@nongnu.org; Mon, 03 Sep 2012 13:53:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1T8apw-00043P-1O
	for qemu-trivial@nongnu.org; Mon, 03 Sep 2012 13:53:27 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36346)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>)
	id 1T8apv-00043G-N7; Mon, 03 Sep 2012 13:53:23 -0400
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q83HrMG5026611
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 3 Sep 2012 13:53:23 -0400
Received: from doriath.home (ovpn-113-57.phx2.redhat.com [10.3.113.57])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q83HrKAN022038; Mon, 3 Sep 2012 13:53:21 -0400
Date: Mon, 3 Sep 2012 14:54:09 -0300
From: Luiz Capitulino <lcapitulino@redhat.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20120903145409.409ff53f@doriath.home>
In-Reply-To: <5044E573.7010300@weilnetz.de>
References: <1346496778-15014-1-git-send-email-sw@weilnetz.de>
	<20120903134129.74b4a264@doriath.home>
	<5044E092.4030300@weilnetz.de> <5044E573.7010300@weilnetz.de>
Organization: Red Hat
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Anthony Liguori <aliguori@us.ibm.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] json-parser: Fix potential
 NULL pointer segfault
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
X-List-Received-Date: Mon, 03 Sep 2012 17:53:31 -0000

On Mon, 03 Sep 2012 19:14:27 +0200
Stefan Weil <sw@weilnetz.de> wrote:

> Am 03.09.2012 18:53, schrieb Stefan Weil:
> > Am 03.09.2012 18:41, schrieb Luiz Capitulino:
> >> On Sat,  1 Sep 2012 12:52:58 +0200
> >> Stefan Weil <sw@weilnetz.de> wrote:
> >>
> >>> Report from smatch:
> >>> json-parser.c:474 parse_object(62) error: potential null derefence 
> >>> 'dict'.
> >>> json-parser.c:553 parse_array(75) error: potential null derefence 
> >>> 'list'.
> >>>
> >>> Label out can be called with list == NULL.
> >>>
> >>> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> >>> ---
> >>>   json-parser.c |    8 ++++++--
> >>>   1 file changed, 6 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/json-parser.c b/json-parser.c
> >>> index 457291b..c31c759 100644
> >>> --- a/json-parser.c
> >>> +++ b/json-parser.c
> >>> @@ -471,7 +471,9 @@ static QObject *parse_object(JSONParserContext 
> >>> *ctxt, va_list *ap)
> >>>     out:
> >>>       parser_context_restore(ctxt, saved_ctxt);
> >>> -    QDECREF(dict);
> >>> +    if (dict) {
> >>> +        QDECREF(dict);
> >>> +    }
> >>
> >> I prefer changing QDECREF() to a nop if obj is NULL.
> >
> > That's fine for me, too. If everybody agrees, I'll send two new
> > patches: one to change QDECREF, one to remove the if statements
> > from other code locations which use the same pattern as
> > my original patch.
> >
> > Cheers,
> >
> > - sw
> >
> >
> 
> What about modifying QOBJECT to return NULL if called with a NULL pointer?
> That would be a more generic fix for the same problem.

I don't like this because it's not obvious, besides, at least in theory
we'd have to change QOBJECT() users to check its return value.

On the other hand, QDECREF() is expected to do nothing if its argument is
NULL.

