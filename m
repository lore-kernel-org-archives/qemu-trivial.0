Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kETde-00040i-U1
	for mharc-qemu-trivial@gnu.org; Sat, 05 Sep 2020 04:33:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kETdd-00040F-C5
 for qemu-trivial@nongnu.org; Sat, 05 Sep 2020 04:33:33 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:31692
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kETdb-00004y-J1
 for qemu-trivial@nongnu.org; Sat, 05 Sep 2020 04:33:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599294810;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q0IKNRVI3YAFFXTpzaHng5Qgq6iVqAIoM5CZsmOW6bA=;
 b=D7qYS4MDKClNliqXeSMofN7TMwevuXLnZx0rbv83J9+iBagS/FG9PkVtP3PawmHk/XTPdc
 dI5xS4M6HoZJxAWZCeSzGkLYZJ4M8UgPiqVw9Qt8M6yNg2OfUIAYq0ROhWgRLQWNekPWg4
 3AL6SgZpcl7CJRY5zW+UaDlJQirzh0M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-XT5z5vCMNiiEqKRr3DIU1Q-1; Sat, 05 Sep 2020 04:33:28 -0400
X-MC-Unique: XT5z5vCMNiiEqKRr3DIU1Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 420A2100670D;
 Sat,  5 Sep 2020 08:33:27 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-27.ams2.redhat.com [10.36.112.27])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2F3F05D9CA;
 Sat,  5 Sep 2020 08:33:24 +0000 (UTC)
Subject: Re: [PATCH v5 08/11] osdep: These function are only available on
 Non-Win32 system.
To: Yonggang Luo <luoyonggang@gmail.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, QEMU Block <qemu-block@nongnu.org>,
 Stefan Weil <sw@weilnetz.de>, Peter Lieven <pl@kamp.de>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, QEMU Trivial <qemu-trivial@nongnu.org>
References: <20200905062333.1087-1-luoyonggang@gmail.com>
 <20200905062333.1087-9-luoyonggang@gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <8d7357bc-518e-e408-bf56-32fcce8bb520@redhat.com>
Date: Sat, 5 Sep 2020 10:33:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200905062333.1087-9-luoyonggang@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=207.211.31.120; envelope-from=thuth@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/05 03:25:07
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.107, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sat, 05 Sep 2020 08:33:33 -0000

On 05/09/2020 08.23, Yonggang Luo wrote:
> int qemu_lock_fd(int fd, int64_t start, int64_t len, bool exclusive);
> int qemu_unlock_fd(int fd, int64_t start, int64_t len);
> int qemu_lock_fd_test(int fd, int64_t start, int64_t len, bool exclusive);
> bool qemu_has_ofd_lock(void);
> 
> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> ---
>  include/qemu/osdep.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
> index 412962d91a..e80fddd1e8 100644
> --- a/include/qemu/osdep.h
> +++ b/include/qemu/osdep.h
> @@ -502,11 +502,11 @@ int qemu_close(int fd);
>  int qemu_unlink(const char *name);
>  #ifndef _WIN32
>  int qemu_dup(int fd);
> -#endif
>  int qemu_lock_fd(int fd, int64_t start, int64_t len, bool exclusive);
>  int qemu_unlock_fd(int fd, int64_t start, int64_t len);
>  int qemu_lock_fd_test(int fd, int64_t start, int64_t len, bool exclusive);
>  bool qemu_has_ofd_lock(void);
> +#endif
>  
>  #if defined(__HAIKU__) && defined(__i386__)
>  #define FMT_pid "%ld"
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


