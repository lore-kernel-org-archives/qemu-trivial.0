Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YSNKL-0005KN-5D
	for mharc-qemu-trivial@gnu.org; Mon, 02 Mar 2015 05:11:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33945)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YSNKC-00056h-O8
	for qemu-trivial@nongnu.org; Mon, 02 Mar 2015 05:11:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YSNKB-0000ON-Ed
	for qemu-trivial@nongnu.org; Mon, 02 Mar 2015 05:11:44 -0500
Received: from mx1.redhat.com ([209.132.183.28]:33145)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1YSNK7-0000Mf-54; Mon, 02 Mar 2015 05:11:39 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t22ABYpN022294
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Mon, 2 Mar 2015 05:11:34 -0500
Received: from blackfin.pond.sub.org (ovpn-116-68.ams2.redhat.com
	[10.36.116.68])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t22ABWMV019294
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Mon, 2 Mar 2015 05:11:34 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 3038A3042B60; Mon,  2 Mar 2015 11:11:32 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: zhanghailiang <zhang.zhanghailiang@huawei.com>
References: <1425114327-12136-1-git-send-email-zhang.zhanghailiang@huawei.com>
	<1425114327-12136-3-git-send-email-zhang.zhanghailiang@huawei.com>
Date: Mon, 02 Mar 2015 11:11:32 +0100
In-Reply-To: <1425114327-12136-3-git-send-email-zhang.zhanghailiang@huawei.com>
	(zhanghailiang's message of "Sat, 28 Feb 2015 17:05:24 +0800")
Message-ID: <87k2yzhfor.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, peter.huangpeng@huawei.com, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH RFC 2/5] qdev: Avoid
	qerror_report_err() outside QMP command handlers
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
X-List-Received-Date: Mon, 02 Mar 2015 10:11:51 -0000

zhanghailiang <zhang.zhanghailiang@huawei.com> writes:

> qerror_report_err() is a transitional interface to help with
> converting existing monitor commands to QMP.  It should not be used
> elsewhere.  Replace by error_report_err() in qdev_init() and
> device_post_init().
>
> Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
> ---
>  hw/core/qdev.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/hw/core/qdev.c b/hw/core/qdev.c
> index 44c6b93..9adcd27 100644
> --- a/hw/core/qdev.c
> +++ b/hw/core/qdev.c
> @@ -181,8 +181,7 @@ int qdev_init(DeviceState *dev)
>  
>      object_property_set_bool(OBJECT(dev), true, "realized", &local_err);
>      if (local_err != NULL) {
> -        qerror_report_err(local_err);
> -        error_free(local_err);
> +        error_report_err(local_err);
>          object_unparent(OBJECT(dev));
>          return -1;
>      }

This breaks QMP device_add's error reply.

The patches I posted together remove all calls of qdev_init().  Once
they're all merged, the function should be simply dropped.

> @@ -1189,8 +1188,7 @@ static void device_post_init(Object *obj)
>      Error *err = NULL;
>      qdev_prop_set_globals(DEVICE(obj), &err);
>      if (err) {
> -        qerror_report_err(err);
> -        error_free(err);
> +        error_report_err(err);
>          exit(EXIT_FAILURE);
>      }
>  }

This one is part of a wider problem I solved in

[PATCH] qdev: Don't exit when running into bad -global

