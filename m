Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TxjQG-0003Ji-IS
	for mharc-qemu-trivial@gnu.org; Tue, 22 Jan 2013 14:22:16 -0500
Received: from eggs.gnu.org ([208.118.235.92]:56802)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1TxjQD-0003IS-QZ
	for qemu-trivial@nongnu.org; Tue, 22 Jan 2013 14:22:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1Txh77-0001bQ-OV
	for qemu-trivial@nongnu.org; Tue, 22 Jan 2013 11:54:23 -0500
Received: from mx1.redhat.com ([209.132.183.28]:48133)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>)
	id 1Txh71-0001ab-4P; Tue, 22 Jan 2013 11:54:15 -0500
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r0MGsEJL020056
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 22 Jan 2013 11:54:14 -0500
Received: from doriath.home (ovpn-113-33.phx2.redhat.com [10.3.113.33])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r0MGsBdM028205; Tue, 22 Jan 2013 11:54:13 -0500
Date: Tue, 22 Jan 2013 14:54:21 -0200
From: Luiz Capitulino <lcapitulino@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <20130122145421.152dbb76@doriath.home>
In-Reply-To: <1358849286-24750-12-git-send-email-armbru@redhat.com>
References: <1358849286-24750-1-git-send-email-armbru@redhat.com>
	<1358849286-24750-12-git-send-email-armbru@redhat.com>
Organization: Red Hat
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v3 11/11] qemu-ga: Fix
 unchecked strdup() by converting to g_strdup()
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
X-List-Received-Date: Tue, 22 Jan 2013 19:22:15 -0000

On Tue, 22 Jan 2013 11:08:06 +0100
Markus Armbruster <armbru@redhat.com> wrote:

> I figure it's freed somewhere deep down in QAPI, with g_free().

It is, by qapi_dealloc_type_str().

> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>

Reviewed-by: Luiz Capitulino <lcapitulino@redhat.com>

> ---
>  qga/commands.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/qga/commands.c b/qga/commands.c
> index 7ffb35e..528b082 100644
> --- a/qga/commands.c
> +++ b/qga/commands.c
> @@ -61,7 +61,7 @@ struct GuestAgentInfo *qmp_guest_info(Error **err)
>  
>      while (*cmd_list) {
>          cmd_info = g_malloc0(sizeof(GuestAgentCommandInfo));
> -        cmd_info->name = strdup(*cmd_list);
> +        cmd_info->name = g_strdup(*cmd_list);
>          cmd_info->enabled = qmp_command_is_enabled(cmd_info->name);
>  
>          cmd_info_list = g_malloc0(sizeof(GuestAgentCommandInfoList));


