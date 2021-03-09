Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lJixp-000329-GN
	for mharc-qemu-trivial@gnu.org; Tue, 09 Mar 2021 15:28:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lJixl-0002y6-Qf; Tue, 09 Mar 2021 15:28:18 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:57659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lJixj-0000kw-5w; Tue, 09 Mar 2021 15:28:17 -0500
Received: from [192.168.100.1] ([82.142.6.26]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MA7Su-1lUCI42iy2-00BeUI; Tue, 09 Mar 2021 21:28:10 +0100
Subject: Re: [PATCH] hw/elf_ops: Fix a typo
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Stefano Garzarella <sgarzare@redhat.com>
References: <20210225181344.3623720-1-philmd@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <e9a2eaa7-1689-41a2-c69f-ee616b7af00e@vivier.eu>
Date: Tue, 9 Mar 2021 21:28:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210225181344.3623720-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:s5e5x8u/If0bvj4bH5sk62dxRWPjErYoAURFcige9q2Exrko5up
 5fDAXj9DZu2O2kMF60/orF7p8qjFn85OyEb0J49utxFJSN7PpvsPks0suOdFdI72oCCEssC
 s6K/HCBFUOea+cRhfjp6xJ/Y9FG0ZaaS45hkKUkw450ZugMx20Nozqchx/lTgrzwAR4xTjZ
 HKawyfPX2aTyjytLqehxw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:iL2GQNw8x2w=:8gLpoA12ZOPYHDmgoyjWc+
 uXpvqQukGEIZJE6wMFqo8SOR73r6uuKmE46oP7SzVX5the41b3XZPTa9vazpdPgn9hFetFmjv
 yZu2CjD3NIRZoFrlzYKPn1g8BCP55tiswy+jYkSsG7WfgdSBLP/VdMEEYOYn53Dq6sbnDCNnI
 AvLCPjJ0VkkabqHSnVBl9861dqo1U+AKzqio7qgigte780KzfRWcXKToiL6f3EjJEWYEM1fMr
 lh5+45uWddDWLrLvvNUa5bi3ziMJM10svOCTpogEGR3vU1wpFNgQM0mwhVo6tv7I4/2ciugCp
 8T6qUuABTp9tDA5yXVUKaW3c8Shyy1yiz+kbfs8SrDAGt5baNS4LdxwRAct7mDt/4orEvu1hr
 kuE2tR94gt0UyYMBwfZZI20MKXSIvd6zbxGz3RixphcQFLavN8TmWsNc4IxlC
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 09 Mar 2021 20:28:19 -0000

Le 25/02/2021 à 19:13, Philippe Mathieu-Daudé a écrit :
> g_mapped_file_new_from_fd()'s parameter is named 'writable'.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  include/hw/elf_ops.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/hw/elf_ops.h b/include/hw/elf_ops.h
> index 8e8436831d2..304f266bf3b 100644
> --- a/include/hw/elf_ops.h
> +++ b/include/hw/elf_ops.h
> @@ -417,7 +417,7 @@ static int glue(load_elf, SZ)(const char *name, int fd,
>  
>      /*
>       * Since we want to be able to modify the mapped buffer, we set the
> -     * 'writeble' parameter to 'true'. Modifications to the buffer are not
> +     * 'writable' parameter to 'true'. Modifications to the buffer are not
>       * written back to the file.
>       */
>      mapped_file = g_mapped_file_new_from_fd(fd, true, NULL);
> 

Applied to my trivial-patches branch.

Thanks,
Laurent


