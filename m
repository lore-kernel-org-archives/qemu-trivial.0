Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bnWtJ-0007kV-Tj
	for mharc-qemu-trivial@gnu.org; Fri, 23 Sep 2016 16:16:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32946)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mlureau@redhat.com>) id 1bnWtH-0007et-Bc
	for qemu-trivial@nongnu.org; Fri, 23 Sep 2016 16:16:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mlureau@redhat.com>) id 1bnWtD-0001Qc-0u
	for qemu-trivial@nongnu.org; Fri, 23 Sep 2016 16:16:10 -0400
Received: from mx4-phx2.redhat.com ([209.132.183.25]:59749)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mlureau@redhat.com>)
	id 1bnWtC-0001PZ-NF; Fri, 23 Sep 2016 16:16:06 -0400
Received: from zmail17.collab.prod.int.phx2.redhat.com
	(zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
	by mx4-phx2.redhat.com (8.13.8/8.13.8) with ESMTP id u8NKG4SJ025626;
	Fri, 23 Sep 2016 16:16:04 -0400
Date: Fri, 23 Sep 2016 16:16:04 -0400 (EDT)
From: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <mlureau@redhat.com>
To: David Anderson <dave@natulte.net>
Cc: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	=?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Message-ID: <1102009456.1545865.1474661764218.JavaMail.zimbra@redhat.com>
In-Reply-To: <CAMx+r7XKTASxhX3N=7n_BxO=9vnNPed2fsSGyQw8wigiGgk65A@mail.gmail.com>
References: <20160922040019.19165-1-dave@natulte.net>
	<dcfeabcb-bfb5-b184-0842-b3413889eb56@redhat.com>
	<CAMx+r7XKTASxhX3N=7n_BxO=9vnNPed2fsSGyQw8wigiGgk65A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.3.116.40]
X-Mailer: Zimbra 8.0.6_GA_5922 (ZimbraWebClient - FF48 (Linux)/8.0.6_GA_5922)
Thread-Topic: qapi: make the json schema files more regular.
Thread-Index: IC1Gxe8uyiOMVEeCJlpTRSYSrzMlPA==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 209.132.183.25
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qapi: make the json schema
 files more regular.
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
X-List-Received-Date: Fri, 23 Sep 2016 20:16:12 -0000

Hi

----- Original Message -----
> On Thu, Sep 22, 2016 at 6:07 AM, Eric Blake <eblake@redhat.com> wrote:
> 
> > On 09/21/2016 11:00 PM, David Anderson wrote:
> > > This makes it easier to parse the schema file for tool generation:
> > > each paragraph is either a non-docstring comment, or a docstring
> > > immediately followed by a Python dict describing an API item.
> > >
> > > Signed-off-by: David Anderson <dave@natulte.net>
> > > ---
> > >  qapi-schema.json     | 3 +--
> > >  qapi/block-core.json | 5 -----
> > >  2 files changed, 1 insertion(+), 7 deletions(-)
> >
> > Related to the work Marc-Andre is already doing, but fine to take now.
> >
> 
> Do you have a link to that work? It sounds like the schema format may be
> changing, which is relevant to my interests since I'm trying to parse it :).
> 

I wrote a schema doc parser/generator: see http://patchew.org/QEMU/20160922155808.8504-1-marcandre.lureau%40redhat.com/.

The format is not changing, just augmented a bit.

> - Dave
> 
> 
> >
> > Reviewed-by: Eric Blake <eblake@redhat.com>
> >
> > >
> > > diff --git a/qapi-schema.json b/qapi-schema.json
> > > index e507061..edd803f 100644
> > > --- a/qapi-schema.json
> > > +++ b/qapi-schema.json
> > > @@ -752,6 +752,7 @@
> > >              'cpu-throttle-increment': 'int',
> > >              'tls-creds': 'str',
> > >              'tls-hostname': 'str'} }
> > > +
> > >  ##
> > >  # @query-migrate-parameters
> > >  #
> > > @@ -4115,7 +4116,6 @@
> > >  #
> > >  # Since 1.6
> > >  ##
> > > -
> > >  { 'struct': 'RxFilterInfo',
> > >    'data': {
> > >      'name':               'str',
> > > @@ -4335,7 +4335,6 @@
> > >  #
> > >  # Since: 2.1
> > >  ##
> > > -
> > >  { 'struct': 'Memdev',
> > >    'data': {
> > >      'size':       'size',
> > > diff --git a/qapi/block-core.json b/qapi/block-core.json
> > > index 24223fd..e12fbd3 100644
> > > --- a/qapi/block-core.json
> > > +++ b/qapi/block-core.json
> > > @@ -25,7 +25,6 @@
> > >  # Since: 1.3
> > >  #
> > >  ##
> > > -
> > >  { 'struct': 'SnapshotInfo',
> > >    'data': { 'id': 'str', 'name': 'str', 'vm-state-size': 'int',
> > >              'date-sec': 'int', 'date-nsec': 'int',
> > > @@ -81,7 +80,6 @@
> > >  #
> > >  # Since: 1.7
> > >  ##
> > > -
> > >  { 'union': 'ImageInfoSpecific',
> > >    'data': {
> > >        'qcow2': 'ImageInfoSpecificQCow2',
> > > @@ -129,7 +127,6 @@
> > >  # Since: 1.3
> > >  #
> > >  ##
> > > -
> > >  { 'struct': 'ImageInfo',
> > >    'data': {'filename': 'str', 'format': 'str', '*dirty-flag': 'bool',
> > >             '*actual-size': 'int', 'virtual-size': 'int',
> > > @@ -181,7 +178,6 @@
> > >  # Since: 1.4
> > >  #
> > >  ##
> > > -
> > >  { 'struct': 'ImageCheck',
> > >    'data': {'filename': 'str', 'format': 'str', 'check-errors': 'int',
> > >             '*image-end-offset': 'int', '*corruptions': 'int', '*leaks':
> > 'int',
> > > @@ -518,7 +514,6 @@
> > >  #
> > >  # Since: 2.5
> > >  ##
> > > -
> > >  { 'struct': 'BlockDeviceTimedStats',
> > >    'data': { 'interval_length': 'int', 'min_rd_latency_ns': 'int',
> > >              'max_rd_latency_ns': 'int', 'avg_rd_latency_ns': 'int',
> > >
> >
> > --
> > Eric Blake   eblake redhat com    +1-919-301-3266
> > Libvirt virtualization library http://libvirt.org
> >
> >
> 

