Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ltsiM-0006AD-Im
	for mharc-qemu-trivial@gnu.org; Thu, 17 Jun 2021 10:09:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1ltsiL-00065w-Dv; Thu, 17 Jun 2021 10:09:49 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:58209)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1ltsiJ-0003KE-Kh; Thu, 17 Jun 2021 10:09:49 -0400
Received: from [192.168.100.1] ([82.142.19.46]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1Mg6uW-1lNYVN11RO-00heYn; Thu, 17 Jun 2021 16:09:43 +0200
Subject: Re: [PATCH v2] linux-user/trace-events: fix minor typo in format
 string
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20210614144245.17660-1-alex.bennee@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <c4d3c46f-5777-745e-948b-344c67a83cc6@vivier.eu>
Date: Thu, 17 Jun 2021 16:09:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210614144245.17660-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:WjPM8tSEuRmkTFGuk4IRyyiN2JnlVgosOM0jwxEC6jSQ8+Xc6J3
 3P1+S305nC+Pxppy2mUsqGybyyKGmO30XXwvVg6cGSeLLsuidQeu2IltOvvanL2g41ej4yq
 myb+PagR6oPr1qWUTqG+W19PPXHzoxV6XxKkwiyT455w5P+Y3cP+6jcps8eBBReaZZyllKY
 oUMQyQIboAjWCk8IU0+Qw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:5gPDSagS8uk=:i0PIRXmhUqZvJxEtI+kCyn
 ic9zc1XHLzbfBUjYRU4Y1s/LQQ3Zq1RODWc4Zh69Ngbl7Is8KbatSQm6jw+w+/Zt0F3JCAx+v
 PIBqcBe6EnpqGnon9payHbHbZRled1eUq+wPwLtMDOlKm5dQEgplsSAfkcc5lTxxxly1kqnmM
 qTU1LVeaNuTeANZjCepDzsYAjjriCvu7/5uY2eIbsTdJjSEaDzff/OMA0OJ03Opq0488pj7dt
 ABd0Ib+TWmTiBCCqLgx5PY5CxSY6P3loDJ+RK07pHPo4hX+IFYUZYRYuMgdT3ionjowB3R9Zr
 LAZ0zWzDFXCvvitleCHKimneu31+kqW7054wAlm7lkpGBQckFULD3OtJWr38ifmxj+/wIItyM
 Vdb10hTCVuFjm+nhhxF+7wYFx6d0qJfiAj78l5OrK+pPwvEizcfs+1aasYICh9pPQ1GHhIhNi
 s4QvcJZS0h+UMhUEYJFeU/fDNZUqXjESvmEKlQDo0697QtFcGtXcR6SgMdkyti8vyts3t00JZ
 hKb6C6bDKdG8JrQvIjPR6E=
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.254,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 17 Jun 2021 14:09:49 -0000

Le 14/06/2021 à 16:42, Alex Bennée a écrit :
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> v2
>   - fix typo in summary :-O
> ---
>  linux-user/trace-events | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/linux-user/trace-events b/linux-user/trace-events
> index 1ec0d11ee3..e7d2f54e94 100644
> --- a/linux-user/trace-events
> +++ b/linux-user/trace-events
> @@ -11,7 +11,7 @@ user_do_rt_sigreturn(void *env, uint64_t frame_addr) "env=%p frame_addr=0x%"PRIx
>  user_do_sigreturn(void *env, uint64_t frame_addr) "env=%p frame_addr=0x%"PRIx64
>  user_force_sig(void *env, int target_sig, int host_sig) "env=%p signal %d (host %d)"
>  user_handle_signal(void *env, int target_sig) "env=%p signal %d"
> -user_host_signal(void *env, int host_sig, int target_sig) "env=%p signal %d (target %d("
> +user_host_signal(void *env, int host_sig, int target_sig) "env=%p signal %d (target %d)"
>  user_queue_signal(void *env, int target_sig) "env=%p signal %d"
>  user_s390x_restore_sigregs(void *env, uint64_t sc_psw_addr, uint64_t env_psw_addr) "env=%p frame psw.addr 0x%"PRIx64 " current psw.addr 0x%"PRIx64
>  
> 

Applied to my linux-user-for-6.1 branch.

Thanks,
Laurent

