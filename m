Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aSnuE-0005rm-Nq
	for mharc-qemu-trivial@gnu.org; Mon, 08 Feb 2016 10:39:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46871)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1aSnuC-0005pN-Mi
	for qemu-trivial@nongnu.org; Mon, 08 Feb 2016 10:39:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1aSnuB-00013c-Lh
	for qemu-trivial@nongnu.org; Mon, 08 Feb 2016 10:39:12 -0500
Received: from mx1.redhat.com ([209.132.183.28]:57389)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1aSnu6-0000xl-CM; Mon, 08 Feb 2016 10:39:06 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id 018F014CAB1;
	Mon,  8 Feb 2016 15:39:05 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-40.ams2.redhat.com
	[10.36.116.40])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u18Fd4Ox024187
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Mon, 8 Feb 2016 10:39:05 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id E813D303F81B; Mon,  8 Feb 2016 16:39:03 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
References: <20160111173036.24764.59878.stgit@bahia.huguette.org>
	<569D22F6.5070104@msgid.tls.msk.ru>
	<20160118192843.55ef9d93@bahia.huguette.org>
	<20160208151147.GC31586@stefanha-x1.localdomain>
Date: Mon, 08 Feb 2016 16:39:03 +0100
In-Reply-To: <20160208151147.GC31586@stefanha-x1.localdomain> (Stefan
	Hajnoczi's message of "Mon, 8 Feb 2016 15:11:47 +0000")
Message-ID: <87d1s7w6so.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel@nongnu.org, Greg Kurz <gkurz@linux.vnet.ibm.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] trace: drop trailing empty
	strings
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
X-List-Received-Date: Mon, 08 Feb 2016 15:39:13 -0000

Stefan Hajnoczi <stefanha@gmail.com> writes:

> On Mon, Jan 18, 2016 at 07:28:43PM +0100, Greg Kurz wrote:
>> On Mon, 18 Jan 2016 20:37:58 +0300
>> Michael Tokarev <mjt@tls.msk.ru> wrote:
>> 
>> > 11.01.2016 20:30, Greg Kurz wrote:
>> > 
>> > > -virtio_balloon_handle_output(const char *name, uint64_t gpa) "section name: %s gpa: %"PRIx64""
>> > > +virtio_balloon_handle_output(const char *name, uint64_t gpa) "section name: %s gpa: %"PRIx64  
>> > ...
>> > 
>> > I'm not sure what's the value of this.  It's fine either way, no?
>> 
>> The only value is to drop unneeded stuff... and maybe some consistency
>> with the traces that don't have these trailing empty strings.
>> 
>> > Do we have a rule for trailing empty strings in coding style? :)
>> > 
>> 
>> Nor we have against parenthesitis, which brings a lot more unneeded
>> characters into the code :P
>
> Regarding the history of the quoting limitation, see commit
> cf85cf8e972f3ad79f203be4edb7968d6e052293 ("trace: Format strings must
> begin/end with double quotes").  It was a limitation of the old
> tracetool.sh script.
>
> The modern tracetool.py script handles format strings fine when they do
> not end with double-quotes.

Suggest to work that into the commit message.

> Thanks, applied to my tracing tree:
> https://github.com/stefanha/qemu/commits/tracing
>
> Stefan

