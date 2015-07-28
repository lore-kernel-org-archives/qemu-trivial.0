Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZK68q-0005EA-LL
	for mharc-qemu-trivial@gnu.org; Tue, 28 Jul 2015 10:46:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58162)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kchamart@redhat.com>) id 1ZJzfj-0003EB-5b
	for qemu-trivial@nongnu.org; Tue, 28 Jul 2015 03:51:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kchamart@redhat.com>) id 1ZJzfh-0002Hy-Lh
	for qemu-trivial@nongnu.org; Tue, 28 Jul 2015 03:51:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51682)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kchamart@redhat.com>)
	id 1ZJzfb-0002GZ-9C; Tue, 28 Jul 2015 03:51:27 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id 3832291DB3;
	Tue, 28 Jul 2015 07:51:26 +0000 (UTC)
Received: from tesla.localdomain (ovpn-116-77.ams2.redhat.com [10.36.116.77])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id t6S7pMhn018109
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 28 Jul 2015 03:51:23 -0400
Received: by tesla.localdomain (Postfix, from userid 1000)
	id 02509240E56; Tue, 28 Jul 2015 09:51:21 +0200 (CEST)
Date: Tue, 28 Jul 2015 09:51:21 +0200
From: Kashyap Chamarthy <kchamart@redhat.com>
To: John Snow <jsnow@redhat.com>
Message-ID: <20150728075121.GA13890@tesla.redhat.com>
References: <1435775149-17285-1-git-send-email-jsnow@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1435775149-17285-1-git-send-email-jsnow@redhat.com>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
X-Mailman-Approved-At: Tue, 28 Jul 2015 10:46:03 -0400
Cc: qemu-trivial@nongnu.org, mjt@tls.msk.ru, qemu-devel@nongnu.org,
	lcapitulino@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qmp-shell: add documentation
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
X-List-Received-Date: Tue, 28 Jul 2015 07:51:36 -0000

On Wed, Jul 01, 2015 at 02:25:49PM -0400, John Snow wrote:
> I should probably document the changes that were made.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  scripts/qmp/qmp-shell | 35 +++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)

Since I did some tests[1] when you wrote these improvements to
qmp-shell, the change looks good, FWIW:

    Reviewed-By: Kashyap Chamarthy <kchamart@redhat.com>

[1]
https://lists.nongnu.org/archive/html/qemu-devel/2015-04/msg04201.html

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
> -- 
> 2.1.0
> 
> 

-- 
/kashyap

