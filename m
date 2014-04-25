Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WdiFJ-0001Zl-SH
	for mharc-qemu-trivial@gnu.org; Fri, 25 Apr 2014 11:41:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47248)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1WdiFD-0001LP-2k
	for qemu-trivial@nongnu.org; Fri, 25 Apr 2014 11:41:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1WdiF7-0001UP-Q6
	for qemu-trivial@nongnu.org; Fri, 25 Apr 2014 11:40:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41384)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>)
	id 1WdiEx-0001T6-5f; Fri, 25 Apr 2014 11:40:39 -0400
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s3PFeZK0032620
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 25 Apr 2014 11:40:36 -0400
Received: from localhost (ovpn-113-123.phx2.redhat.com [10.3.113.123])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id s3PFeYxk019791; Fri, 25 Apr 2014 11:40:34 -0400
Date: Fri, 25 Apr 2014 11:40:33 -0400
From: Luiz Capitulino <lcapitulino@redhat.com>
To: Hani Benhabiles <kroosec@gmail.com>
Message-ID: <20140425114033.50333f11@redhat.com>
In-Reply-To: <1398203043-20559-1-git-send-email-kroosec@gmail.com>
References: <1398203043-20559-1-git-send-email-kroosec@gmail.com>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org, afaerber@suse.de, imammedo@redhat.com
Subject: Re: [Qemu-trivial] [PATCH] qmp: Remove unused variable.
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
X-List-Received-Date: Fri, 25 Apr 2014 15:41:00 -0000

On Tue, 22 Apr 2014 22:44:03 +0100
Hani Benhabiles <kroosec@gmail.com> wrote:

> Signed-off-by: Hani Benhabiles <hani@linux.com>
> ---
>  qmp.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/qmp.c b/qmp.c
> index 87a28f7..44a6e17 100644
> --- a/qmp.c
> +++ b/qmp.c
> @@ -194,11 +194,10 @@ void qmp_system_wakeup(Error **errp)
>  ObjectPropertyInfoList *qmp_qom_list(const char *path, Error **errp)
>  {
>      Object *obj;
> -    bool ambiguous = false;
>      ObjectPropertyInfoList *props = NULL;
>      ObjectProperty *prop;
>  
> -    obj = object_resolve_path(path, &ambiguous);
> +    obj = object_resolve_path(path, NULL);
>      if (obj == NULL) {
>          error_set(errp, QERR_DEVICE_NOT_FOUND, path);
>          return NULL;

I'm under the impression that this check in object_resolve_partial_path():

        if (ambiguous && *ambiguous) {
            return NULL;
        }

Uses 'ambiguous' internally. In that case, this change could have a side effect.

But I'm not sure, I think it would be good to get a reviewed-by from
a QOM expert.

