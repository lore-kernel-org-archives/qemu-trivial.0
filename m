Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Zk4qR-0002og-1h
	for mharc-qemu-trivial@gnu.org; Thu, 08 Oct 2015 02:38:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48551)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1Zhgtm-0008FB-L5
	for qemu-trivial@nongnu.org; Thu, 01 Oct 2015 12:40:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1Zhgtl-0000LF-Tq
	for qemu-trivial@nongnu.org; Thu, 01 Oct 2015 12:40:02 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34156)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>)
	id 1Zhgte-0000Is-F0; Thu, 01 Oct 2015 12:39:54 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id 11402A2C36;
	Thu,  1 Oct 2015 16:39:54 +0000 (UTC)
Received: from scv.usersys.redhat.com (vpn-48-83.rdu2.redhat.com [10.10.48.83])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t91Gdr9q020271; Thu, 1 Oct 2015 12:39:53 -0400
To: qemu-devel@nongnu.org
References: <1442868929-17777-1-git-send-email-jsnow@redhat.com>
From: John Snow <jsnow@redhat.com>
X-Enigmail-Draft-Status: N1110
Message-ID: <560D61D9.3030609@redhat.com>
Date: Thu, 1 Oct 2015 12:39:53 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <1442868929-17777-1-git-send-email-jsnow@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, mjt@tls.msk.ru
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qtest/ahci: fix redundant
	assertion
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
X-List-Received-Date: Thu, 01 Oct 2015 16:40:06 -0000



On 09/21/2015 04:55 PM, John Snow wrote:
> Fixes https://bugs.launchpad.net/qemu/+bug/1497711
> 
> (!ncq || (ncq && lba48)) is the same as
> (!ncq || lba48).
> 
> The intention is simply: "If a command is NCQ,
> it must also be LBA48."
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  tests/libqos/ahci.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/libqos/ahci.c b/tests/libqos/ahci.c
> index cf66b3e..adb2665 100644
> --- a/tests/libqos/ahci.c
> +++ b/tests/libqos/ahci.c
> @@ -742,7 +742,7 @@ AHCICommand *ahci_command_create(uint8_t command_name)
>      g_assert(!(props->lba28 && props->lba48));
>      g_assert(!(props->read && props->write));
>      g_assert(!props->size || props->data);
> -    g_assert(!props->ncq || (props->ncq && props->lba48));
> +    g_assert(!props->ncq || props->lba48);
>  
>      /* Defaults and book-keeping */
>      cmd->props = props;
> 

Tentatively staged. Barring objections, I will send a pull request for
this tomorrow, thanks.

https://github.com/jnsnow/qemu/commits/ide
https://github.com/jnsnow/qemu.git

--js

