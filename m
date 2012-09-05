Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T9HjE-0000WX-Gi
	for mharc-qemu-trivial@gnu.org; Wed, 05 Sep 2012 11:41:20 -0400
Received: from eggs.gnu.org ([208.118.235.92]:50970)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1T9Hj4-0008Uf-Ao
	for qemu-trivial@nongnu.org; Wed, 05 Sep 2012 11:41:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1T9Hj3-0005iG-2r
	for qemu-trivial@nongnu.org; Wed, 05 Sep 2012 11:41:10 -0400
Received: from mail-pb0-f45.google.com ([209.85.160.45]:35781)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1T9Hix-0005cE-MO; Wed, 05 Sep 2012 11:41:03 -0400
Received: by mail-pb0-f45.google.com with SMTP id jt11so1174718pbb.4
	for <multiple recipients>; Wed, 05 Sep 2012 08:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=fpGuphh2ErkLITxn/McukAPRynbweb4vo69kSPc9a+w=;
	b=ZkX33YRGH2CT5fhDkDRtrkpjpD4AmzoBBmlJygqBtNWLjRdDScSqPvh3ssemhopExo
	Jv5ZHvbB315CFs5Lae7x05dFZAK9C12yORKLDVMP/8ymGUjT6p6WtDZpVjDGYY2yMD1N
	MEr1kYMbrnKwYDhqO59isJ1w325NFdeb4JBsaLvzO8qDGFzzDvxjRlIY6ebzkOOMNj+g
	aNX+xYGL5m7u2Y9A4n61KQdg1QJU2M3AqG1WaVTTyC0Qj76N/QS2GclaZU2KobDZzxd3
	yoRIqZNWz0SdSsBIZsX4ZngfjFb8P6DdZOwEnmJxzvOvY3k/7ALQ2RDCQr+98dwQEk1v
	v8Ng==
Received: by 10.66.74.100 with SMTP id s4mr49771628pav.27.1346859663208;
	Wed, 05 Sep 2012 08:41:03 -0700 (PDT)
Received: from yakj.usersys.redhat.com (93-34-169-1.ip50.fastwebnet.it.
	[93.34.169.1])
	by mx.google.com with ESMTPS id kt2sm1638816pbc.73.2012.09.05.08.40.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 05 Sep 2012 08:41:01 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <50477289.5070703@redhat.com>
Date: Wed, 05 Sep 2012 17:40:57 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: riegamaths@gmail.com
References: <1346851493-9149-1-git-send-email-riegamaths@gmail.com>
In-Reply-To: <1346851493-9149-1-git-send-email-riegamaths@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.160.45
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH v3] block: output more error messages if
 failed to create temporary snapshot
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
X-List-Received-Date: Wed, 05 Sep 2012 15:41:19 -0000

Il 05/09/2012 15:24, riegamaths@gmail.com ha scritto:
> From: Dunrong Huang <riegamaths@gmail.com>
> 
> If we failed to create temporary snapshot, the error message did not match
> with the error, for example:
> 
> $ TMPDIR=/tmp/bad_path qemu-system-x86_64 -enable-kvm debian.qcow2 -snapshot
> qemu-system-x86_64: -enable-kvm: could not open disk image /home/mathslinux/Images/debian.qcow2: No such file or directory
> 
> Indeed, the file which cant be created is /tmp/bad_path/vl.xxxxxx,  not
> debian.qcow2. so the error message makes users feel confused.
> 
> Signed-off-by: Dunrong Huang <riegamaths@gmail.com>
> ---
> v1 -> v2:
>    Output error message only if fd < 0
> v2 -> v3:
>    Output error message in the caller of get_tmp_filename()
>  block.c | 2 ++
>  1 个文件被修改，插入 2 行(+)
> 
> diff --git a/block.c b/block.c
> index 470bdcc..074987e 100644
> --- a/block.c
> +++ b/block.c
> @@ -764,6 +764,8 @@ int bdrv_open(BlockDriverState *bs, const char *filename, int flags,
>  
>          ret = get_tmp_filename(tmp_filename, sizeof(tmp_filename));
>          if (ret < 0) {
> +            fprintf(stderr, "Could not create temporary snapshot %s: %s\n",
> +                    tmp_filename, strerror(errno));
>              return ret;
>          }
>  
> 

Looks good.

Paolo

