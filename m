Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Zgg8W-0000T0-8Y
	for mharc-qemu-trivial@gnu.org; Mon, 28 Sep 2015 17:39:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57062)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ZgVwv-0002ZH-Eh
	for qemu-trivial@nongnu.org; Mon, 28 Sep 2015 06:46:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ZgVwu-0001yt-MY
	for qemu-trivial@nongnu.org; Mon, 28 Sep 2015 06:46:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53408)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>)
	id 1ZgVwn-0001uC-0t; Mon, 28 Sep 2015 06:46:17 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id 94B659159D;
	Mon, 28 Sep 2015 10:46:16 +0000 (UTC)
Received: from [10.36.7.147] (vpn1-7-147.ams2.redhat.com [10.36.7.147])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t8SAkCNk004295
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 28 Sep 2015 06:46:14 -0400
To: Laurent Vivier <laurent@vivier.eu>, qemu-trivial@nongnu.org
References: <1443284532-8634-1-git-send-email-laurent@vivier.eu>
	<1443284532-8634-3-git-send-email-laurent@vivier.eu>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <56091A74.6050904@redhat.com>
Date: Mon, 28 Sep 2015 12:46:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <1443284532-8634-3-git-send-email-laurent@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
	Alexander Graf <agraf@suse.de>, qemu-ppc@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 02/10][TRIVIAL] cmd646: add
 to storage category
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
X-List-Received-Date: Mon, 28 Sep 2015 10:46:26 -0000

On 26/09/15 18:22, Laurent Vivier wrote:
> cmd646 is an IDE controller, so add it to the
> storage category.
> 
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> ---
>  hw/ide/cmd646.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/ide/cmd646.c b/hw/ide/cmd646.c
> index 66fb9d9..27f3da2 100644
> --- a/hw/ide/cmd646.c
> +++ b/hw/ide/cmd646.c
> @@ -417,6 +417,7 @@ static void cmd646_ide_class_init(ObjectClass *klass, void *data)
>      k->config_read = cmd646_pci_config_read;
>      k->config_write = cmd646_pci_config_write;
>      dc->props = cmd646_ide_properties;
> +    set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
>  }

Reviewed-by: Thomas Huth <thuth@redhat.com>




