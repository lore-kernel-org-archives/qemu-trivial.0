Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ipC0n-0004nU-7I
	for mharc-qemu-trivial@gnu.org; Wed, 08 Jan 2020 09:08:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39772)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1ipC0k-0004mv-4q
 for qemu-trivial@nongnu.org; Wed, 08 Jan 2020 09:08:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1ipC0i-0000uT-SC
 for qemu-trivial@nongnu.org; Wed, 08 Jan 2020 09:08:37 -0500
Received: from 8.mo3.mail-out.ovh.net ([87.98.172.249]:47298)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1ipC0i-0000rR-LN
 for qemu-trivial@nongnu.org; Wed, 08 Jan 2020 09:08:36 -0500
Received: from player794.ha.ovh.net (unknown [10.108.35.12])
 by mo3.mail-out.ovh.net (Postfix) with ESMTP id 4722923B7C8
 for <qemu-trivial@nongnu.org>; Wed,  8 Jan 2020 15:08:33 +0100 (CET)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player794.ha.ovh.net (Postfix) with ESMTPSA id 62352AFBC6D5;
 Wed,  8 Jan 2020 14:08:30 +0000 (UTC)
Date: Wed, 8 Jan 2020 15:08:29 +0100
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Cc: qemu-devel@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 qemu-trivial@nongnu.org
Subject: Re: [PATCH v1 45/59] 9pfs/9p.c: remove unneeded labels
Message-ID: <20200108150829.6664f450@bahia.lan>
In-Reply-To: <13045963.Gd4jlxRJ09@silver>
References: <20200106182425.20312-1-danielhb413@gmail.com>
 <20200106182425.20312-46-danielhb413@gmail.com>
 <13045963.Gd4jlxRJ09@silver>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 16312319329440340288
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrvdehkedgiedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfesthejredtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdekvddrvdehfedrvddtkedrvdegkeenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeelgedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdqthhrihhvihgrlhesnhhonhhgnhhurdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 87.98.172.249
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 08 Jan 2020 14:08:39 -0000

On Tue, 07 Jan 2020 13:14:20 +0100
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> On Montag, 6. Januar 2020 19:24:11 CET Daniel Henrique Barboza wrote:
> > 'out' label in v9fs_xattr_write() and 'out_nofid' label in
> > v9fs_complete_rename() can be replaced by appropriate return
> > calls.
> > 
> > CC: Greg Kurz <groug@kaod.org>
> > Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> > ---
> >  hw/9pfs/9p.c | 9 +++------
> >  1 file changed, 3 insertions(+), 6 deletions(-)
> > 
> > diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> > index 520177f40c..be2beba4cd 100644
> > --- a/hw/9pfs/9p.c
> > +++ b/hw/9pfs/9p.c
> > @@ -2464,8 +2464,7 @@ static int v9fs_xattr_write(V9fsState *s, V9fsPDU
> > *pdu, V9fsFidState *fidp,
> > 
> > 
> >      if (fidp->fs.xattr.len < off) {
> > -        err = -ENOSPC;
> > -        goto out;
> > +        return -ENOSPC;
> >      }
> >      write_count = fidp->fs.xattr.len - off;
> >      if (write_count > count) {
> > @@ -2491,7 +2490,7 @@ static int v9fs_xattr_write(V9fsState *s, V9fsPDU
> > *pdu, V9fsFidState *fidp, off += to_copy;
> >          write_count -= to_copy;
> >      }
> > -out:
> > +
> >      return err;
> >  }
> > 
> > @@ -3056,8 +3055,7 @@ static int coroutine_fn v9fs_complete_rename(V9fsPDU
> > *pdu, V9fsFidState *fidp, if (newdirfid != -1) {
> >          dirfidp = get_fid(pdu, newdirfid);
> >          if (dirfidp == NULL) {
> > -            err = -ENOENT;
> > -            goto out_nofid;
> > +            return -ENOENT;
> >          }
> >          if (fidp->fid_type != P9_FID_NONE) {
> >              err = -EINVAL;
> > @@ -3100,7 +3098,6 @@ out:
> >          put_fid(pdu, dirfidp);
> >      }
> >      v9fs_path_free(&new_path);
> > -out_nofid:
> >      return err;
> >  }
> 
> Same as with patch 44: IMO not any improvement, but also not any behaviour 
> change at least. So it's up to you Greg.
> 

I don't really care either but as you say it doesn't change behaviour, and
and the diffstat is nice :)

Acked-by: Greg Kurz <groug@kaod.org>

> Best regards,
> Christian Schoenebeck
> 
> 


