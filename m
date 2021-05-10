Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lg6oY-0003N4-Rf
	for mharc-qemu-trivial@gnu.org; Mon, 10 May 2021 10:23:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lg6oX-0003Jl-C4
 for qemu-trivial@nongnu.org; Mon, 10 May 2021 10:23:17 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:26082)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lg6oV-0007SG-ET
 for qemu-trivial@nongnu.org; Mon, 10 May 2021 10:23:17 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-376-28UniGKtOkKqYsPFje6OZg-1; Mon, 10 May 2021 10:23:04 -0400
X-MC-Unique: 28UniGKtOkKqYsPFje6OZg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 729681922037;
 Mon, 10 May 2021 14:23:02 +0000 (UTC)
Received: from bahia.lan (ovpn-112-152.ams2.redhat.com [10.36.112.152])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8D1D15D705;
 Mon, 10 May 2021 14:23:01 +0000 (UTC)
Date: Mon, 10 May 2021 16:23:00 +0200
From: Greg Kurz <groug@kaod.org>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Subject: Re: [PATCH] virtiofsd: Fix check of chown()'s return value
Message-ID: <20210510162300.546af5cb@bahia.lan>
In-Reply-To: <YJlAN+eLMASsJxsL@work-vm>
References: <162040394890.714971.15502455176528384778.stgit@bahia.lan>
 <YJlAN+eLMASsJxsL@work-vm>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Mon, 10 May 2021 14:23:17 -0000

On Mon, 10 May 2021 15:16:23 +0100
"Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:

> * Greg Kurz (groug@kaod.org) wrote:
> > Otherwise you always get this warning when using --socket-group=3Dusers
> >=20
> >  vhost socket failed to set group to users (100)
> >=20
> > While here, print out the error if chown() fails.
> >=20
> > Signed-off-by: Greg Kurz <groug@kaod.org>
>=20
> probably needs a fixes:  but yes.
>=20

Fixes: f6698f2b03b0 ("tools/virtiofsd: add support for --socket-group")

> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>=20
> > ---
> >  tools/virtiofsd/fuse_virtio.c |    4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_virti=
o.c
> > index 3e13997406bf..638d3ffe2f8a 100644
> > --- a/tools/virtiofsd/fuse_virtio.c
> > +++ b/tools/virtiofsd/fuse_virtio.c
> > @@ -978,9 +978,9 @@ static int fv_create_listen_socket(struct fuse_sess=
ion *se)
> >      if (se->vu_socket_group) {
> >          struct group *g =3D getgrnam(se->vu_socket_group);
> >          if (g) {
> > -            if (!chown(se->vu_socket_path, -1, g->gr_gid)) {
> > +            if (chown(se->vu_socket_path, -1, g->gr_gid) =3D=3D -1) {
> >                  fuse_log(FUSE_LOG_WARNING,
> > -                         "vhost socket failed to set group to %s (%d)\=
n",
> > +                         "vhost socket failed to set group to %s (%d):=
 %m\n",
> >                           se->vu_socket_group, g->gr_gid);
> >              }
> >          }
> >=20
> >=20


