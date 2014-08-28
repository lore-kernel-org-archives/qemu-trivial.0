Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XMyg1-0001nK-ON
	for mharc-qemu-trivial@gnu.org; Thu, 28 Aug 2014 08:19:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38182)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1XMyft-0001eJ-Ue
	for qemu-trivial@nongnu.org; Thu, 28 Aug 2014 08:19:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1XMyfn-0000W6-VE
	for qemu-trivial@nongnu.org; Thu, 28 Aug 2014 08:19:33 -0400
Received: from mail-wg0-x22c.google.com ([2a00:1450:400c:c00::22c]:63503)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1XMyfb-0000T5-2l; Thu, 28 Aug 2014 08:19:15 -0400
Received: by mail-wg0-f44.google.com with SMTP id m15so660148wgh.15
	for <multiple recipients>; Thu, 28 Aug 2014 05:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=hGd8o6ySUf4jXxgZL28+niRvnzppGqrDMir05ERSXSE=;
	b=c/Q/6UOfEt6t2XqWRnrhoSXDT+dCQ3DsesM95ErwlaER3R9MLbH9qpW2xUUBSdSMtX
	q40pxKdGOEcRudLO3YgSykB6Fi+FS+JseLgS+Zs5Rjvgcj9ug+n6gjTiOi46YDE6nrcI
	jcnyKGw+vS0QTQnMPc7/ZlmihRIzaV2HvdHsCANXIUPxb8GnLSf4I4TCxjaXNdBaHPEB
	NigrorUH1VqLKiy/OpLvq6PJrjFaRtw/Dj8BcI1P4Cyefa8hHAtRu744AfDCjVoEPWWk
	PR9JenMvFOY+sKtdkNKy5nTrat6ebveTEi/I1UoH7q/er8FTciI5sdOgKhyv6IUNc4nW
	GdOA==
X-Received: by 10.180.86.1 with SMTP id l1mr5590485wiz.62.1409228354220;
	Thu, 28 Aug 2014 05:19:14 -0700 (PDT)
Received: from localhost (44.175.90.146.dyn.plus.net. [146.90.175.44])
	by mx.google.com with ESMTPSA id ew1sm9507464wjb.31.2014.08.28.05.19.12
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 Aug 2014 05:19:13 -0700 (PDT)
Date: Thu, 28 Aug 2014 13:19:11 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Dmitry Fleytman <dmitry@daynix.com>
Message-ID: <20140828121911.GM26741@stefanha-thinkpad.redhat.com>
References: <1409119123-15445-1-git-send-email-dmitry@daynix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wAI/bQb0EMvlZCHl"
Content-Disposition: inline
In-Reply-To: <1409119123-15445-1-git-send-email-dmitry@daynix.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c00::22c
Cc: qemu-trivial@nongnu.org, Yan Vugenfirer <yan@daynix.com>,
	qemu-devel@nongnu.org, Anthony Liguori <anthony@codemonkey.ws>,
	Markus Armbruster <armbru@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] MAINTAINERS: Add VMWare
	devices maintainer
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
X-List-Received-Date: Thu, 28 Aug 2014 12:19:40 -0000


--wAI/bQb0EMvlZCHl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 27, 2014 at 08:58:43AM +0300, Dmitry Fleytman wrote:
> Signed-off-by: Dmitry Fleytman <dmitry@daynix.com>
> ---
>  MAINTAINERS | 6 ++++++
>  1 file changed, 6 insertions(+)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--wAI/bQb0EMvlZCHl
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJT/x4/AAoJEJykq7OBq3PIQ+MIAK/f4nWdSt3PF/eAALBKxo9P
nW8oxvX/uBGmnLHZ/LiBwQuaJRh9YLYAnkE1CdEZPtFbwGnm+ySANe/omQAfJ+Fy
tg618BO4q+SRqeiJDgxUUiW9H6gYy6zWNNapZlp/P1oPkrttf9KmcfMuHnis+7O5
KDTF1/mZY/3FeCxpF0ob6bX/xazq32oKtF7L0M5fyCgoIK4sBqaH/vBJXibtYfp5
ABMVWVnvlJ5OrBnQVxPykmebRHQ2Q/eyuOmmjKn4QoZEQIbWnr2EcsoPqI7WunW+
VGI9SMc48c4PQNBuUvpxRKNXhe8Se1om9R0MMEwDcX9Fk/Ki/UbxY1gxX5MBrVk=
=QbX/
-----END PGP SIGNATURE-----

--wAI/bQb0EMvlZCHl--

