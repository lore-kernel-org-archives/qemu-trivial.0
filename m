Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V1yQs-00086w-8M
	for mharc-qemu-trivial@gnu.org; Wed, 24 Jul 2013 08:44:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45917)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1V1yQp-00082q-Ai
	for qemu-trivial@nongnu.org; Wed, 24 Jul 2013 08:44:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1V1yQn-0007TO-P7
	for qemu-trivial@nongnu.org; Wed, 24 Jul 2013 08:44:39 -0400
Received: from cantor2.suse.de ([195.135.220.15]:55611 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1V1yQk-0007Sp-I5; Wed, 24 Jul 2013 08:44:34 -0400
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 915D3A398F;
	Wed, 24 Jul 2013 14:44:33 +0200 (CEST)
Message-ID: <51EFCC2E.5040804@suse.de>
Date: Wed, 24 Jul 2013 14:44:30 +0200
From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130620 Thunderbird/17.0.7
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>, Ed Maste <emaste@freebsd.org>
References: <1374225073-12959-1-git-send-email-mjt@msgid.tls.msk.ru>
	<1374225073-12959-3-git-send-email-mjt@msgid.tls.msk.ru>
In-Reply-To: <1374225073-12959-3-git-send-email-mjt@msgid.tls.msk.ru>
X-Enigmail-Version: 1.6a1pre
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, Anthony Liguori <aliguori@us.ibm.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL trivial 2/5] slirp: remove
 mbuf(m_hdr, m_dat) indirection
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
X-List-Received-Date: Wed, 24 Jul 2013 12:44:41 -0000

Am 19.07.2013 11:11, schrieb Michael Tokarev:
> ---

NACK, this commit in the pull request is lacking Signed-off-bys!

The original patch (attachment in reply to "slirp: reorder include to
fix FreeBSD build failure") had a misspelled "Signed-off-By" from mjt.
Michael, can you please re-add that and submit a v2 pull?

Ed, maybe you want to turn your "I'm happy" into an Acked-by or
Tested-by while at it? ;)

Regards,
Andreas

>  slirp/mbuf.h     |   51 ++++++++++++++++++----------------------------=
-----
>  slirp/tcp_subr.c |   12 ++++++------
>  2 files changed, 24 insertions(+), 39 deletions(-)
>=20
> diff --git a/slirp/mbuf.h b/slirp/mbuf.h
> index 3f3ab09..b144f1c 100644
> --- a/slirp/mbuf.h
> +++ b/slirp/mbuf.h
> @@ -49,22 +49,6 @@
>   * free the m_ext.  This is inefficient memory-wise, but who cares.
>   */
> =20
> -/* XXX should union some of these! */
> -/* header at beginning of each mbuf: */
> -struct m_hdr {
> -	struct	mbuf *mh_next;		/* Linked list of mbufs */
> -	struct	mbuf *mh_prev;
> -	struct	mbuf *mh_nextpkt;	/* Next packet in queue/record */
> -	struct	mbuf *mh_prevpkt; /* Flags aren't used in the output queue */
> -	int	mh_flags;	  /* Misc flags */
> -
> -	int	mh_size;		/* Size of data */
> -	struct	socket *mh_so;
> -
> -	caddr_t	mh_data;		/* Location of data */
> -	int	mh_len;			/* Amount of data in this mbuf */
> -};
> -
>  /*
>   * How much room is in the mbuf, from m_data to the end of the mbuf
>   */
> @@ -80,29 +64,30 @@ struct m_hdr {
>  #define M_TRAILINGSPACE M_FREEROOM
> =20
>  struct mbuf {
> -	struct	m_hdr m_hdr;
> +	/* XXX should union some of these! */
> +	/* header at beginning of each mbuf: */
> +	struct	mbuf *m_next;		/* Linked list of mbufs */
> +	struct	mbuf *m_prev;
> +	struct	mbuf *m_nextpkt;	/* Next packet in queue/record */
> +	struct	mbuf *m_prevpkt;	/* Flags aren't used in the output queue */
> +	int	m_flags;		/* Misc flags */
> +
> +	int	m_size;			/* Size of data */
> +	struct	socket *m_so;
> +
> +	caddr_t	m_data;			/* Location of data */
> +	int	m_len;			/* Amount of data in this mbuf */
> +
>  	Slirp *slirp;
>  	bool	arp_requested;
>  	uint64_t expiration_date;
>  	/* start of dynamic buffer area, must be last element */
> -	union M_dat {
> -		char	m_dat_[1]; /* ANSI don't like 0 sized arrays */
> -		char	*m_ext_;
> -	} M_dat;
> +	union {
> +		char	m_dat[1]; /* ANSI don't like 0 sized arrays */
> +		char	*m_ext;
> +	};
>  };
> =20
> -#define m_next		m_hdr.mh_next
> -#define m_prev		m_hdr.mh_prev
> -#define m_nextpkt	m_hdr.mh_nextpkt
> -#define m_prevpkt	m_hdr.mh_prevpkt
> -#define m_flags		m_hdr.mh_flags
> -#define	m_len		m_hdr.mh_len
> -#define	m_data		m_hdr.mh_data
> -#define m_size		m_hdr.mh_size
> -#define m_dat		M_dat.m_dat_
> -#define m_ext		M_dat.m_ext_
> -#define m_so		m_hdr.mh_so
> -
>  #define ifq_prev m_prev
>  #define ifq_next m_next
>  #define ifs_prev m_prevpkt
> diff --git a/slirp/tcp_subr.c b/slirp/tcp_subr.c
> index e98ce1a..043f28f 100644
> --- a/slirp/tcp_subr.c
> +++ b/slirp/tcp_subr.c
> @@ -647,7 +647,7 @@ tcp_emu(struct socket *so, struct mbuf *m)
>  			n4 =3D  (laddr & 0xff);
> =20
>  			m->m_len =3D bptr - m->m_data; /* Adjust length */
> -                        m->m_len +=3D snprintf(bptr, m->m_hdr.mh_size =
- m->m_len,
> +                        m->m_len +=3D snprintf(bptr, m->m_size - m->m_=
len,
>                                               "ORT %d,%d,%d,%d,%d,%d\r\=
n%s",
>                                               n1, n2, n3, n4, n5, n6, x=
=3D=3D7?buff:"");
>  			return 1;
> @@ -680,7 +680,7 @@ tcp_emu(struct socket *so, struct mbuf *m)
>  			n4 =3D  (laddr & 0xff);
> =20
>  			m->m_len =3D bptr - m->m_data; /* Adjust length */
> -			m->m_len +=3D snprintf(bptr, m->m_hdr.mh_size - m->m_len,
> +			m->m_len +=3D snprintf(bptr, m->m_size - m->m_len,
>                                               "27 Entering Passive Mode=
 (%d,%d,%d,%d,%d,%d)\r\n%s",
>                                               n1, n2, n3, n4, n5, n6, x=
=3D=3D7?buff:"");
> =20
> @@ -706,7 +706,7 @@ tcp_emu(struct socket *so, struct mbuf *m)
>  		if (m->m_data[m->m_len-1] =3D=3D '\0' && lport !=3D 0 &&
>  		    (so =3D tcp_listen(slirp, INADDR_ANY, 0, so->so_laddr.s_addr,
>  		                     htons(lport), SS_FACCEPTONCE)) !=3D NULL)
> -                    m->m_len =3D snprintf(m->m_data, m->m_hdr.mh_size,=
 "%d",
> +                    m->m_len =3D snprintf(m->m_data, m->m_size, "%d",
>                                          ntohs(so->so_fport)) + 1;
>  		return 1;
> =20
> @@ -726,7 +726,7 @@ tcp_emu(struct socket *so, struct mbuf *m)
>  				return 1;
>  			}
>  			m->m_len =3D bptr - m->m_data; /* Adjust length */
> -                        m->m_len +=3D snprintf(bptr, m->m_hdr.mh_size,
> +                        m->m_len +=3D snprintf(bptr, m->m_size,
>                                               "DCC CHAT chat %lu %u%c\n=
",
>                                               (unsigned long)ntohl(so->=
so_faddr.s_addr),
>                                               ntohs(so->so_fport), 1);
> @@ -737,7 +737,7 @@ tcp_emu(struct socket *so, struct mbuf *m)
>  				return 1;
>  			}
>  			m->m_len =3D bptr - m->m_data; /* Adjust length */
> -                        m->m_len +=3D snprintf(bptr, m->m_hdr.mh_size,
> +                        m->m_len +=3D snprintf(bptr, m->m_size,
>                                               "DCC SEND %s %lu %u %u%c\=
n", buff,
>                                               (unsigned long)ntohl(so->=
so_faddr.s_addr),
>                                               ntohs(so->so_fport), n1, =
1);
> @@ -748,7 +748,7 @@ tcp_emu(struct socket *so, struct mbuf *m)
>  				return 1;
>  			}
>  			m->m_len =3D bptr - m->m_data; /* Adjust length */
> -                        m->m_len +=3D snprintf(bptr, m->m_hdr.mh_size,
> +                        m->m_len +=3D snprintf(bptr, m->m_size,
>                                               "DCC MOVE %s %lu %u %u%c\=
n", buff,
>                                               (unsigned long)ntohl(so->=
so_faddr.s_addr),
>                                               ntohs(so->so_fport), n1, =
1);
>=20


--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

