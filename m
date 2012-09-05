Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T9Hik-0007zz-0V
	for mharc-qemu-trivial@gnu.org; Wed, 05 Sep 2012 11:40:50 -0400
Received: from eggs.gnu.org ([208.118.235.92]:50882)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1T9Hii-0007v2-EQ
	for qemu-trivial@nongnu.org; Wed, 05 Sep 2012 11:40:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1T9Hid-0005du-TP
	for qemu-trivial@nongnu.org; Wed, 05 Sep 2012 11:40:48 -0400
Received: from mail-pb0-f45.google.com ([209.85.160.45]:35781)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1T9HiT-0005cE-AB; Wed, 05 Sep 2012 11:40:33 -0400
Received: by pbbjt11 with SMTP id jt11so1174718pbb.4
	for <multiple recipients>; Wed, 05 Sep 2012 08:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=lc+mu0PYrXZlpj/OqjHiaZrwMeAEDFbfPu5/lFwZJzU=;
	b=J5Ie1PbLLirT8nRTZj2N/x42LXsNVIaRZiNR3DJlTLOV8pPCtqx4DPTt9XoKYBoVVw
	qpah1oxFJQCTi2fAbQM68UmTVAaAcbn/qAaxmugDO0zTT+KZXGE7HbYykeajAeEUTMk9
	6B2SHFuiKJeks2KSOZJUs7TJFbFqkBqAoGWJNK8S2NCY5c6HHRdEZ3FjHMdLr638tZ5O
	WhZ9XJnvqEzf2eBZdKAOWD2MmpKEvEWROxouCF/b6uy6WEmbCiPQcIyNWlkrRVRhz6Aq
	+ZlIDfkYKvtJiUEOVHgy4ooF8ovrvkahXN+k+P3Dm6deebYIkzX+PpE5GrrKCEQtqGUS
	iujA==
Received: by 10.68.234.98 with SMTP id ud2mr54718533pbc.165.1346859632441;
	Wed, 05 Sep 2012 08:40:32 -0700 (PDT)
Received: from yakj.usersys.redhat.com (93-34-169-1.ip50.fastwebnet.it.
	[93.34.169.1])
	by mx.google.com with ESMTPS id pk9sm1674639pbb.4.2012.09.05.08.40.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 05 Sep 2012 08:40:30 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <50477269.8050807@redhat.com>
Date: Wed, 05 Sep 2012 17:40:25 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: riegamaths@gmail.com
References: <1346851582-9296-1-git-send-email-riegamaths@gmail.com>
In-Reply-To: <1346851582-9296-1-git-send-email-riegamaths@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.160.45
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] block: Don't forget to delete temporary
	file
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
X-List-Received-Date: Wed, 05 Sep 2012 15:40:49 -0000

Il 05/09/2012 15:26, riegamaths@gmail.com ha scritto:
> From: Dunrong Huang <riegamaths@gmail.com>
> 
> The caller would not delete temporary file after failed get_tmp_filename().
> 
> Signed-off-by: Dunrong Huang <riegamaths@gmail.com>
> ---
>  block.c | 6 +++++-
>  1 个文件被修改，插入 5 行(+)，删除 1 行(-)
> 
> diff --git a/block.c b/block.c
> index 074987e..2bc9f75 100644
> --- a/block.c
> +++ b/block.c
> @@ -433,7 +433,11 @@ int get_tmp_filename(char *filename, int size)
>          return -EOVERFLOW;
>      }
>      fd = mkstemp(filename);
> -    if (fd < 0 || close(fd)) {
> +    if (fd < 0) {
> +        return -errno;
> +    }
> +    if (close(fd) != 0) {
> +        unlink(filename);
>          return -errno;
>      }
>      return 0;
> 

Not necessary, mkstemp will not create a file if it returns an error.

Paolo

