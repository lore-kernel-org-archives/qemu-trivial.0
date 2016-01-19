Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aLQaE-00051J-TI
	for mharc-qemu-trivial@gnu.org; Tue, 19 Jan 2016 02:20:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51260)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1aLQa9-0004uX-Ji
	for qemu-trivial@nongnu.org; Tue, 19 Jan 2016 02:20:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1aLQa8-0007YK-Jl
	for qemu-trivial@nongnu.org; Tue, 19 Jan 2016 02:20:01 -0500
Received: from mx1.redhat.com ([209.132.183.28]:56939)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1aLQa3-0007Sr-7X; Tue, 19 Jan 2016 02:19:55 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id 9D7F98E362;
	Tue, 19 Jan 2016 07:19:54 +0000 (UTC)
Received: from blackfin.pond.sub.org ([10.3.113.2])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u0J7JoqV030335
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 19 Jan 2016 02:19:51 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 01384303F81B; Tue, 19 Jan 2016 08:19:49 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Alistair Francis <alistair.francis@xilinx.com>
References: <9aab0156c2f307ece61c3d8106450d736553a0d5.1453141118.git.alistair.francis@xilinx.com>
Date: Tue, 19 Jan 2016 08:19:49 +0100
In-Reply-To: <9aab0156c2f307ece61c3d8106450d736553a0d5.1453141118.git.alistair.francis@xilinx.com>
	(Alistair Francis's message of "Mon, 18 Jan 2016 10:42:01 -0800")
Message-ID: <87vb6qdoiy.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: christian.liebhardt@arcor.de, mjt@tls.msk.ru, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org, christian.liebhardt@keysight.com,
	=?utf-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v1 1/1] qom: Correct
	object_property_get_int() description
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
X-List-Received-Date: Tue, 19 Jan 2016 07:20:05 -0000

Copying maintainer.  Always do that even for trivial patches.

Alistair Francis <alistair.francis@xilinx.com> writes:

> The description of object_property_get_int() stated that on an error
> it returns NULL. This is not the case and the function will return -1
> if an error occurs. Update the commented documentation accordingly.
>
> Reported-By: Christian Liebhardt <christian.liebhardt@keysight.com>
> Signed-off-by: Christian Liebhardt <christian.liebhardt@keysight.com>
> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
> ---
>  include/qom/object.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/qom/object.h b/include/qom/object.h
> index 4509166..2848f5e 100644
> --- a/include/qom/object.h
> +++ b/include/qom/object.h
> @@ -1107,7 +1107,7 @@ void object_property_set_int(Object *obj, int64_t value,
>   * @name: the name of the property
>   * @errp: returns an error if this function fails
>   *
> - * Returns: the value of the property, converted to an integer, or NULL if
> + * Returns: the value of the property, converted to an integer, or negative if
>   * an error occurs (including when the property value is not an integer).
>   */
>  int64_t object_property_get_int(Object *obj, const char *name,

