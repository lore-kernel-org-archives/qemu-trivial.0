Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZgrX9-00005l-82
	for mharc-qemu-trivial@gnu.org; Tue, 29 Sep 2015 05:49:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40745)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1ZgZRW-0002ln-DO
	for qemu-trivial@nongnu.org; Mon, 28 Sep 2015 10:30:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1ZgZRQ-0003o7-R0
	for qemu-trivial@nongnu.org; Mon, 28 Sep 2015 10:30:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33091)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>)
	id 1ZgZR7-0003S6-By; Mon, 28 Sep 2015 10:29:49 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id E066BA0B49;
	Mon, 28 Sep 2015 14:29:47 +0000 (UTC)
Received: from scv.usersys.redhat.com (dhcp-17-163.bos.redhat.com
	[10.18.17.163])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t8SETkl9015966; Mon, 28 Sep 2015 10:29:46 -0400
To: Laurent Vivier <laurent@vivier.eu>, qemu-trivial@nongnu.org
References: <1443284532-8634-1-git-send-email-laurent@vivier.eu>
	<1443284532-8634-7-git-send-email-laurent@vivier.eu>
From: John Snow <jsnow@redhat.com>
Message-ID: <56094EDA.6080505@redhat.com>
Date: Mon, 28 Sep 2015 10:29:46 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <1443284532-8634-7-git-send-email-laurent@vivier.eu>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
	qemu-devel@nongnu.org, qemu-block@nongnu.org,
	Alexander Graf <agraf@suse.de>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 06/10][TRIVIAL] macio-ide:
 add to storage category
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
X-List-Received-Date: Mon, 28 Sep 2015 14:30:19 -0000



On 09/26/2015 12:22 PM, Laurent Vivier wrote:
> macio-ide is an IDE controller, so add it
> to the storage category.
> 
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> ---
>  hw/ide/macio.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/ide/macio.c b/hw/ide/macio.c
> index 66ac2ba..893c9b9 100644
> --- a/hw/ide/macio.c
> +++ b/hw/ide/macio.c
> @@ -590,6 +590,7 @@ static void macio_ide_class_init(ObjectClass *oc, void *data)
>      dc->realize = macio_ide_realizefn;
>      dc->reset = macio_ide_reset;
>      dc->vmsd = &vmstate_pmac;
> +    set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
>  }
>  
>  static const TypeInfo macio_ide_type_info = {
> 

Thanks,

Reviewed-by: John Snow <jsnow@redhat.com>

I'll leave this to be staged by whomever stages the entire series.

--js

