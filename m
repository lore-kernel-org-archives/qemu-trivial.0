Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Txh5D-0008Qw-Eg
	for mharc-qemu-trivial@gnu.org; Tue, 22 Jan 2013 11:52:23 -0500
Received: from eggs.gnu.org ([208.118.235.92]:33292)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1Txgrw-0004nv-B2
	for qemu-trivial@nongnu.org; Tue, 22 Jan 2013 11:38:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1Txgru-00055t-U4
	for qemu-trivial@nongnu.org; Tue, 22 Jan 2013 11:38:40 -0500
Received: from mx1.redhat.com ([209.132.183.28]:48324)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>)
	id 1Txgrs-00052M-0W; Tue, 22 Jan 2013 11:38:36 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r0MGcZNo012977
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 22 Jan 2013 11:38:35 -0500
Received: from doriath.home (ovpn-113-33.phx2.redhat.com [10.3.113.33])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r0MGcXIq028142; Tue, 22 Jan 2013 11:38:34 -0500
Date: Tue, 22 Jan 2013 14:38:43 -0200
From: Luiz Capitulino <lcapitulino@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <20130122143843.4c9ba897@doriath.home>
In-Reply-To: <1358849286-24750-11-git-send-email-armbru@redhat.com>
References: <1358849286-24750-1-git-send-email-armbru@redhat.com>
	<1358849286-24750-11-git-send-email-armbru@redhat.com>
Organization: Red Hat
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v3 10/11] qapi: Fix
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
X-List-Received-Date: Tue, 22 Jan 2013 16:52:22 -0000

On Tue, 22 Jan 2013 11:08:05 +0100
Markus Armbruster <armbru@redhat.com> wrote:

> Note that we already free with g_free().
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>

Reviewed-by: Luiz Capitulino <lcapitulino@redhat.com>

> ---
>  qapi/qmp-registry.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/qapi/qmp-registry.c b/qapi/qmp-registry.c
> index 70cdbca..28bbbe8 100644
> --- a/qapi/qmp-registry.c
> +++ b/qapi/qmp-registry.c
> @@ -92,7 +92,7 @@ char **qmp_get_command_list(void)
>      list_head = list = g_malloc0(count * sizeof(char *));
>  
>      QTAILQ_FOREACH(cmd, &qmp_commands, node) {
> -        *list = strdup(cmd->name);
> +        *list = g_strdup(cmd->name);
>          list++;
>      }
>  


