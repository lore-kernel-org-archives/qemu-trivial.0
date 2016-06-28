Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bHuaf-0003Jw-8e
	for mharc-qemu-trivial@gnu.org; Tue, 28 Jun 2016 11:06:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42153)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1bHuaZ-00037k-OE
	for qemu-trivial@nongnu.org; Tue, 28 Jun 2016 11:06:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1bHuaT-0001ed-46
	for qemu-trivial@nongnu.org; Tue, 28 Jun 2016 11:06:10 -0400
Received: from smtp.mail.uni-mannheim.de ([134.155.96.80]:50760)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1bHuaM-0001d8-Dy; Tue, 28 Jun 2016 11:05:58 -0400
Received: from localhost (localhost [127.0.0.1])
	by smtp.mail.uni-mannheim.de (Postfix) with ESMTP id 0EB36103B32;
	Tue, 28 Jun 2016 17:05:57 +0200 (CEST)
X-Virus-Scanned: amavisd-new at uni-mannheim.de
Received: from smtp.mail.uni-mannheim.de ([134.155.96.80])
	by localhost (smtp.mail.uni-mannheim.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id yjoKJV25anDx; Tue, 28 Jun 2016 17:05:56 +0200 (CEST)
Received: from [134.155.36.73] (edv13.bib.uni-mannheim.de [134.155.36.73])
	by smtp.mail.uni-mannheim.de (Postfix) with ESMTPSA id 14B24103027;
	Tue, 28 Jun 2016 17:05:55 +0200 (CEST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
References: <1467125451-16700-1-git-send-email-peter.maydell@linaro.org>
	<1467125451-16700-6-git-send-email-peter.maydell@linaro.org>
Cc: patches@linaro.org
From: Stefan Weil <sw@weilnetz.de>
Message-ID: <eb903508-88ce-d465-634e-e171f14de1f3@weilnetz.de>
Date: Tue, 28 Jun 2016 17:05:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <1467125451-16700-6-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 134.155.96.80
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 5/6] bswap.h: Fix comment
 typo
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 28 Jun 2016 15:06:17 -0000

Am 28.06.2016 um 16:50 schrieb Peter Maydell:
> Fix a typo in a comment.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/qemu/bswap.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/qemu/bswap.h b/include/qemu/bswap.h
> index 3b48cf4..a17d9aa 100644
> --- a/include/qemu/bswap.h
> +++ b/include/qemu/bswap.h
> @@ -116,7 +116,7 @@ static inline uint32_t qemu_bswap_len(uint32_t value, int len)
>  }
>  
>  /*
> - * Same as cpu_to_le{16,23}, except that gcc will figure the result is
> + * Same as cpu_to_le{16,32}, except that gcc will figure the result is
>   * a compile-time constant if you pass in a constant.  So this can be
>   * used to initialize static variables.
>   */
> 


Reviewed-by: Stefan Weil <sw@weilnetz.de>


