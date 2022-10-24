Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1omvsN-0000ax-BU
	for mharc-qemu-trivial@gnu.org; Mon, 24 Oct 2022 07:44:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1omvsL-0000aR-Cl; Mon, 24 Oct 2022 07:44:13 -0400
Received: from mout.kundenserver.de ([212.227.126.134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1omvsJ-0005A7-Jj; Mon, 24 Oct 2022 07:44:13 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1N45th-1pDdo70U5p-0107FU; Mon, 24 Oct 2022 13:44:06 +0200
Message-ID: <3299fbe2-4ff3-10ee-6ae6-1d82717a2cb0@vivier.eu>
Date: Mon, 24 Oct 2022 13:44:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH] accel/tcg/tcg-accel-ops-rr: fix trivial typo
Content-Language: fr
To: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>,
 qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <5dc556dbe241ae03859b7890d1998de5c77b7c6c.1666373742.git.quic_mathbern@quicinc.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <5dc556dbe241ae03859b7890d1998de5c77b7c6c.1666373742.git.quic_mathbern@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:d8WW1St7Tt7gGVUGCSGNMeLdQV+aiKFYQKvwiDyL4D4Hw5eaBvV
 IYh9iWSkg5wfAd4UMBYmS6PztAQxLnJOpNNQ8B6fkAmfJRZUDfdE04CKF01c/1YT8V4yExx
 TXdhox57VC7HDHq2SpuGg220pnG/t6Ucfl/NkBwShlFJ1qXe/ajflrp7Njl3ciuXKmeqZdj
 X8Wd9k2TaNf2KGqeywVZQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ubK1oiUUQxI=:jLkFxYaUtSYSZ/TeEsl8nu
 BVU39CVfmnLwd86RstmR5EluYS7EGYD1odG9bliaKZ9KH7/NxozuuXQBIkrtFhHQavPdyrUED
 zjci6gQMcXotHuSyIZKtKLTHLD7DG4rlW47eguutkOEU4+0YC1yTCWJj9GI5o3WBrRLWFZDo3
 Ugm9YN8PsD/16DLywLyaP6aGWXI3qcQ564SD3thofAIvPVtlQlh2LWTHFWVUpgBbTdy6pjH2k
 cjKZbNEZvI03amIDCDq8FRdTdhkwhCwh7N4P4qjMLpQAfcDtffxB6BdYyIEuG0hxgRnAvtwbi
 8okrHMZeI1NRRzuJ0oIMp6EwAI/rE8Uo4SCzN/Uh5XMIMDZawrzPiMJ7+YvbU16cqJ0q5JiJR
 dgQwQrEw6q9ng+ifQJBGOxhYGulszdFfByF75V4pD+IiRGEAaHnsMslfuIDEAeRFCN9BHEEit
 arZsHK9gAPY4i4+DNigQhg8Fa2I+uISAjxfiAYpFvExsagK0gTzQ40x5MALevAIN3rxXHcxhD
 CYmdAO5hX/ULQgclDHXbnLmzacoIKkwQua7YFkIu0CaSG+TG/FlKX5Vgm48KhcOGCkHvVfNrv
 GFnmjm0f76AslYqitbh3t6GHtLsnEj92GAyUQ1009Ai3OZYdqBNT0EOdymbuMLL/fhwIiFcrU
 XXRd4IhDCUktdwDjvn1cPEzIF5yk24JYCuDGKnJBaoStT51eHVkoL6vLXa9Bbvka6TXr+9iS6
 Spg1R6sN+bn+fkprrLvwj3HaEq0Qn4GRqWLPEwwe15tyQ87dj7dYjIk6jJa696e02k8T946/O
 uNHu1R1
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 24 Oct 2022 11:44:13 -0000

Le 21/10/2022 à 19:36, Matheus Tavares Bernardino a écrit :
> Signed-off-by: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
> ---
>   accel/tcg/tcg-accel-ops-rr.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/accel/tcg/tcg-accel-ops-rr.c b/accel/tcg/tcg-accel-ops-rr.c
> index cc8adc2380..cc912df108 100644
> --- a/accel/tcg/tcg-accel-ops-rr.c
> +++ b/accel/tcg/tcg-accel-ops-rr.c
> @@ -51,7 +51,7 @@ void rr_kick_vcpu_thread(CPUState *unused)
>    *
>    * The kick timer is responsible for moving single threaded vCPU
>    * emulation on to the next vCPU. If more than one vCPU is running a
> - * timer event with force a cpu->exit so the next vCPU can get
> + * timer event we force a cpu->exit so the next vCPU can get
>    * scheduled.
>    *
>    * The timer is removed if all vCPUs are idle and restarted again once

Applied to my trivial-patches branch.

Thanks,
Laurent


