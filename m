Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nMCLf-0001Y9-3h
	for mharc-qemu-trivial@gnu.org; Mon, 21 Feb 2022 12:19:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1nMCLd-0001SM-KM; Mon, 21 Feb 2022 12:19:41 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:51351)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1nMCLb-0006wg-BE; Mon, 21 Feb 2022 12:19:41 -0500
Received: from [192.168.100.1] ([82.142.17.50]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MJmCV-1nfdy90VJp-00K82X; Mon, 21 Feb 2022 18:19:24 +0100
Message-ID: <6b89630e-7d49-5a9d-61c4-9532f6ecea8d@vivier.eu>
Date: Mon, 21 Feb 2022 18:19:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2] target/rx: Remove unused ENV_OFFSET definition
Content-Language: fr
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20220203001252.37982-1-f4bug@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220203001252.37982-1-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:xEQqS0yyjeL4AQu3HTQAXTClGyr5yhBdW2zF19P23HNp6pcTv0N
 xpjEzfYMbIk1828oQ+HSNdC/6Z7Tnws+uV5G2yIaovho0EwTE9XZr4dj4/g6idgoHnRa6jM
 qxCLCVz++jkMAItM2jO+NoSKl0ZkGycV37JL+xdbWsK+kwly2Tz4JOQu2W0MvmNN0zg6e17
 CfP6QdS2TR6ipm5EIPdmg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:TrbU4VCKvJ0=:qUx+OYqKySprCNFVWmE4tU
 0X90Vcyt1x5M9dnhTXa3BcdRmxfp96YJrghtQl7PvxPVsFd7UFGUkXUSQ2Cdu+tHV6cy7xA1/
 6WZ0hM+vnODFOeb00HqkagXulESck9COAQTAh2oYS7SGIWlDeTttGi+MLMOJglu616BGx2Cas
 ZziSU4rvw3ywhXtmPeR/1yH6IwRNQNWw7b45SFNhaPuu1DFmqwAJaTszISZE7Y4EAppq4ODfS
 F9x/pz+tCsVZa/JDDmty6NHtVD3mWmqpy6FG31r+w9mQekd+uGfTbsL1GCMQ8yGF0EZuGLiPr
 Ic31eQEhSDXsemvEhQewMMueG7jw6aSbcTQLs/fEjfIEI1rl8fdwy+DJ91HA71JnsVbD+xOvD
 t6QOy3JnIsDzZLk5hk7+W+A0+RRgcetsTGA0YQOPh8HCRwIAqtz/E90pzYKhtORTp9VvX40HW
 e1JYMxBycKIrpQ1A0zy8wngvM/v/ymKi1Z0J1o6Ejr9P0aIyzLyVodEljcHHffJ5uMSiv9YXV
 wgF30JTp9TotbcxY6cAohM10/7EFKIMSIIlkcHqiyl3joBYXdy59cvkeRKhrbeHujK3X91o8i
 wXyypcG9YCvoC/LlrQIg623z7ZuNBWwo7HLF5P+fp6/HpG3In3Lyd2nDJdGvmHP/a+aksJb/G
 aUxPNUKTqMpQiauAL/uOFgWHAJOCHhF8M1HVPTyPhxUEXySHGRxKE3sMAcaE69RHeXyw=
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 21 Feb 2022 17:19:41 -0000

Le 03/02/2022 à 01:12, Philippe Mathieu-Daudé via a écrit :
> The last use of ENV_OFFSET was removed in 5e1401969b
> ("cpu: Move icount_decr to CPUNegativeOffsetState");
> the commit of target/rx came in just afterward.
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Yoshinori Sato <ysato@users.sourceforge.jp>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   target/rx/cpu.h | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/target/rx/cpu.h b/target/rx/cpu.h
> index 657db84ef0..58adf9edf6 100644
> --- a/target/rx/cpu.h
> +++ b/target/rx/cpu.h
> @@ -116,8 +116,6 @@ struct RXCPU {
>   
>   typedef RXCPU ArchCPU;
>   
> -#define ENV_OFFSET offsetof(RXCPU, env)
> -
>   #define RX_CPU_TYPE_SUFFIX "-" TYPE_RX_CPU
>   #define RX_CPU_TYPE_NAME(model) model RX_CPU_TYPE_SUFFIX
>   #define CPU_RESOLVING_TYPE TYPE_RX_CPU

Applied to my trivial-patches branch.

Thanks,
Laurent


