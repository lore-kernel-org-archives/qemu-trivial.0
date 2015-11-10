Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZwFMk-0001Tm-5V
	for mharc-qemu-trivial@gnu.org; Tue, 10 Nov 2015 15:18:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51125)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1ZwFMh-0001PR-UL
	for qemu-trivial@nongnu.org; Tue, 10 Nov 2015 15:18:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1ZwFMh-0005YM-46
	for qemu-trivial@nongnu.org; Tue, 10 Nov 2015 15:18:03 -0500
Received: from mx1.redhat.com ([209.132.183.28]:32963)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>)
	id 1ZwFMb-0005XZ-0D; Tue, 10 Nov 2015 15:17:57 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id 0F12A42E5B7;
	Tue, 10 Nov 2015 20:17:56 +0000 (UTC)
Received: from scv.usersys.redhat.com (dhcp-17-163.bos.redhat.com
	[10.18.17.163])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tAAKHt7K008818; Tue, 10 Nov 2015 15:17:55 -0500
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
References: <1447186571-27672-1-git-send-email-thuth@redhat.com>
	<1447186571-27672-2-git-send-email-thuth@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <564250F3.7050704@redhat.com>
Date: Tue, 10 Nov 2015 15:17:55 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1447186571-27672-2-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-block@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH 1/4] hw/ide: Remove superfluous return
	statements
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
X-List-Received-Date: Tue, 10 Nov 2015 20:18:05 -0000



On 11/10/2015 03:16 PM, Thomas Huth wrote:
> The "return;" statements at the end of functions do not make
> much sense, so let's remove them.
> 
> Cc: John Snow <jsnow@redhat.com>
> Cc: qemu-block@nongnu.org
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/ide/atapi.c | 1 -
>  hw/ide/macio.c | 2 --
>  2 files changed, 3 deletions(-)
> 
> diff --git a/hw/ide/atapi.c b/hw/ide/atapi.c
> index 747f466..347c6e7 100644
> --- a/hw/ide/atapi.c
> +++ b/hw/ide/atapi.c
> @@ -737,7 +737,6 @@ static void cmd_inquiry(IDEState *s, uint8_t *buf)
>   out:
>      buf[size_idx] = idx - preamble_len;
>      ide_atapi_cmd_reply(s, idx, max_len);
> -    return;
>  }
>  
>  static void cmd_get_configuration(IDEState *s, uint8_t *buf)
> diff --git a/hw/ide/macio.c b/hw/ide/macio.c
> index 893c9b9..8a56115 100644
> --- a/hw/ide/macio.c
> +++ b/hw/ide/macio.c
> @@ -288,8 +288,6 @@ static void pmac_ide_atapi_transfer_cb(void *opaque, int ret)
>  done:
>      block_acct_done(blk_get_stats(s->blk), &s->acct);
>      io->dma_end(opaque);
> -
> -    return;
>  }
>  
>  static void pmac_ide_transfer_cb(void *opaque, int ret)
> 

Fair enough.

Reviewed-by: John Snow <jsnow@redhat.com>

