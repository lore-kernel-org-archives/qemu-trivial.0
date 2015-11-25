Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1a1iE5-0005Ym-TT
	for mharc-qemu-trivial@gnu.org; Wed, 25 Nov 2015 17:07:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53797)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jcody@redhat.com>) id 1a1iE3-0005UP-B3
	for qemu-trivial@nongnu.org; Wed, 25 Nov 2015 17:07:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jcody@redhat.com>) id 1a1iE2-0004at-Cn
	for qemu-trivial@nongnu.org; Wed, 25 Nov 2015 17:07:43 -0500
Received: from mx1.redhat.com ([209.132.183.28]:52531)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jcody@redhat.com>)
	id 1a1iDy-0004a7-4d; Wed, 25 Nov 2015 17:07:38 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id 51B53C0B7AA0;
	Wed, 25 Nov 2015 22:07:37 +0000 (UTC)
Received: from localhost (ovpn-112-89.phx2.redhat.com [10.3.112.89])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tAPM7Z3M019562
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA256 bits=256 verify=NO); 
	Wed, 25 Nov 2015 17:07:36 -0500
Date: Wed, 25 Nov 2015 17:07:35 -0500
From: Jeff Cody <jcody@redhat.com>
To: John Snow <jsnow@redhat.com>
Message-ID: <20151125220735.GC2645@localhost.localdomain>
References: <1448485417-8196-1-git-send-email-jsnow@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1448485417-8196-1-git-send-email-jsnow@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH v2] util/id: fully allocate names table
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
X-List-Received-Date: Wed, 25 Nov 2015 22:07:44 -0000

On Wed, Nov 25, 2015 at 04:03:37PM -0500, John Snow wrote:
> Trivial: this array should be allocated to have ID_MAX entries always.
> Otherwise if someone were to forget to expand this table, the assertion
> in the id generator won't actually trigger; it will read junk data.
> 
> v2: Fix the range assertion, too. Compare against the known actual size
>     of the table instead of what it "should" be.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  util/id.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/util/id.c b/util/id.c
> index bcc64d8..7883fbe 100644
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
> @@ -53,7 +53,7 @@ char *id_generate(IdSubSystems id)
>      static uint64_t id_counters[ID_MAX];
>      uint32_t rnd;
>  
> -    assert(id < ID_MAX);
> +    assert(id < ARRAY_SIZE(id_subsys_str));
>      assert(id_subsys_str[id]);
>  
>      rnd = g_random_int_range(0, 100);
> -- 
> 2.4.3
> 

Reviewed-by: Jeff Cody <jcody@redhat.com>

