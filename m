Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1a1VHV-0006Us-78
	for mharc-qemu-trivial@gnu.org; Wed, 25 Nov 2015 03:18:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45894)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1a1VHS-0006Tj-S4
	for qemu-trivial@nongnu.org; Wed, 25 Nov 2015 03:18:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1a1VHS-0001ED-2P
	for qemu-trivial@nongnu.org; Wed, 25 Nov 2015 03:18:22 -0500
Received: from mx1.redhat.com ([209.132.183.28]:40601)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1a1VHN-0001A2-1H; Wed, 25 Nov 2015 03:18:17 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id E413B8F28D;
	Wed, 25 Nov 2015 08:18:15 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-45.ams2.redhat.com
	[10.36.116.45])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tAP8IEjE019827
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 25 Nov 2015 03:18:15 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 7DB9F303F16C; Wed, 25 Nov 2015 09:18:13 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
References: <1448407631-9405-1-git-send-email-jsnow@redhat.com>
Date: Wed, 25 Nov 2015 09:18:13 +0100
In-Reply-To: <1448407631-9405-1-git-send-email-jsnow@redhat.com> (John Snow's
	message of "Tue, 24 Nov 2015 18:27:11 -0500")
Message-ID: <871tbeijay.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, jcody@redhat.com, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [trivial for-2.6] util/id: fully
	allocate names table
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
X-List-Received-Date: Wed, 25 Nov 2015 08:18:23 -0000

John Snow <jsnow@redhat.com> writes:

> Trivial: this array should be allocated to have ID_MAX entries always.
> Otherwise if someone were to forget to expand this table, the assertion
> in the id generator won't actually trigger; it will read junk data.

You mean this one:

    assert(id < ID_MAX);

The assertion is crap, because it fails to protect array access
id_subsys_str[id].  Here's one that does:

    assert(0 <= id && id < ARRAY_SIZE(id_subsys_str));

> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  util/id.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/util/id.c b/util/id.c
> index bcc64d8..b7ca4d2 100644
> --- a/util/id.c
> +++ b/util/id.c
> @@ -29,7 +29,7 @@ bool id_wellformed(const char *id)
>  
>  #define ID_SPECIAL_CHAR '#'
>  
> -static const char *const id_subsys_str[] = {
> +static const char *const id_subsys_str[ID_MAX] = {
>      [ID_QDEV]  = "qdev",
>      [ID_BLOCK] = "block",
>  };

