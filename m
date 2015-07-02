Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZAgSM-0006j9-7a
	for mharc-qemu-trivial@gnu.org; Thu, 02 Jul 2015 11:31:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43444)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1ZAgSG-0006Zp-UV
	for qemu-trivial@nongnu.org; Thu, 02 Jul 2015 11:31:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1ZAgSF-0005C2-Uv
	for qemu-trivial@nongnu.org; Thu, 02 Jul 2015 11:31:12 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46821)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>)
	id 1ZAgSB-00059D-Cm; Thu, 02 Jul 2015 11:31:07 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id 62A7C374A02;
	Thu,  2 Jul 2015 15:31:06 +0000 (UTC)
Received: from localhost (ovpn-113-155.phx2.redhat.com [10.3.113.155])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t62FV2dI021011; Thu, 2 Jul 2015 11:31:03 -0400
Date: Thu, 2 Jul 2015 11:31:02 -0400
From: Luiz Capitulino <lcapitulino@redhat.com>
To: John Snow <jsnow@redhat.com>
Message-ID: <20150702113102.39ab42a5@redhat.com>
In-Reply-To: <1435775149-17285-1-git-send-email-jsnow@redhat.com>
References: <1435775149-17285-1-git-send-email-jsnow@redhat.com>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, mjt@tls.msk.ru, qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH] qmp-shell: add documentation
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
X-List-Received-Date: Thu, 02 Jul 2015 15:31:13 -0000

On Wed,  1 Jul 2015 14:25:49 -0400
John Snow <jsnow@redhat.com> wrote:

> I should probably document the changes that were made.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>

Looks good to me, CC'ing maintainer.

> ---
>  scripts/qmp/qmp-shell | 35 +++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/scripts/qmp/qmp-shell b/scripts/qmp/qmp-shell
> index 65280d2..fa39bf0 100755
> --- a/scripts/qmp/qmp-shell
> +++ b/scripts/qmp/qmp-shell
> @@ -29,6 +29,41 @@
>  # (QEMU) device_add driver=e1000 id=net1
>  # {u'return': {}}
>  # (QEMU)
> +#
> +# key=value pairs also support Python or JSON object literal subset notations,
> +# without spaces. Dictionaries/objects {} are supported as are arrays [].
> +#
> +#    example-command arg-name1={'key':'value','obj'={'prop':"value"}}
> +#
> +# Both JSON and Python formatting should work, including both styles of
> +# string literal quotes. Both paradigms of literal values should work,
> +# including null/true/false for JSON and None/True/False for Python.
> +#
> +#
> +# Transactions have the following multi-line format:
> +#
> +#    transaction(
> +#    action-name1 [ arg-name1=arg1 ] ... [arg-nameN=argN ]
> +#    ...
> +#    action-nameN [ arg-name1=arg1 ] ... [arg-nameN=argN ]
> +#    )
> +#
> +# One line transactions are also supported:
> +#
> +#    transaction( action-name1 ... )
> +#
> +# For example:
> +#
> +#     (QEMU) transaction(
> +#     TRANS> block-dirty-bitmap-add node=drive0 name=bitmap1
> +#     TRANS> block-dirty-bitmap-clear node=drive0 name=bitmap0
> +#     TRANS> )
> +#     {"return": {}}
> +#     (QEMU)
> +#
> +# Use the -v and -p options to activate the verbose and pretty-print options,
> +# which will echo back the properly formatted JSON-compliant QMP that is being
> +# sent to QEMU, which is useful for debugging and documentation generation.
>  
>  import qmp
>  import json


