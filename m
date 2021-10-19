Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mclGy-0001vH-91
	for mharc-qemu-trivial@gnu.org; Tue, 19 Oct 2021 05:19:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mclGr-0001sb-Jp; Tue, 19 Oct 2021 05:18:57 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:44561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mclGo-0005Bt-Mb; Tue, 19 Oct 2021 05:18:56 -0400
Received: from [192.168.100.1] ([82.142.24.54]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MOQu6-1mLmsT2gmc-00PuAW; Tue, 19 Oct 2021 11:18:47 +0200
Subject: Re: [PATCH v2 1/6] docs: rSTify the "TrivialPatches" wiki
To: Kashyap Chamarthy <kchamart@redhat.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>, 
 qemu-trivial@nongnu.org, Eric Blake <eblake@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
References: <20211019090344.3054300-1-kchamart@redhat.com>
 <20211019090344.3054300-2-kchamart@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <322f1d0e-e349-5554-9112-65a01f97c2e7@vivier.eu>
Date: Tue, 19 Oct 2021 11:18:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20211019090344.3054300-2-kchamart@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:/X/oyhsINLTlDke3wjMPCsiEHCXg5dsY/6qBkRtPQJHHpnUjwLa
 6oFijZhX6UYjLg2BnI3rnqpq8t9YSAnFo3CsOocY1sPoIMBOb6NSRF+/2RvmnvMeCHcq13i
 a00HdVg7aWG12g3iwMhr6C8SmhrBfbaC2fTlsA+z8AgNGBSKLmmTRxwb123GVMA+6uh6WaW
 e6IgJNwN8u1DCSsYv2iig==
X-UI-Out-Filterresults: notjunk:1;V03:K0:uj5NJYqp52Y=:BGN7Ixtnj5VkypgMzVwiNy
 rY4QNOo+kqe+oQatGdmqmjDTfQAV2f2sPi22FcKqnKdit+ncAtXZo1Vkoaq7Tx39hrRNMn96Q
 0JvMgEUsO5LEGlpwMxAt5/CJm4zKtmpohNONjqVcjrCDP1qj2yefsxkhQ9N2jPHiEa1bOY964
 KkjwdCeSO3jO+QkHEfrfOpN0zaXHbxLxXrtH5u7OY4pkLAx3ymXRulg808HMasCsyeRTBuWRn
 dkWKAyvUmPJeU7bO3tHif1HYks6y+UhTwR0nICArO6lCEN7CmR1EcbDN3maFE8ivvDgxYy39p
 BsZzSwxoUzVvM3AOaIZX4fcOGuY0blblQwWp/b3gaRMq4EcgQ0oSR35/t588Jj+FHUkjru2yr
 Ny+JlS8cixrfx472LmEChENrS9r3qycJobxlL5Ytru21Lonprs72dmyJ/mD6vVZnfFrl7irVT
 /eqI3SdrJSIYaYLlE+JC9Wp5/4S6Rlj2VLVFk4c01uTzXY/GBO27NXTwD16wpU2wJw7uV7IKS
 iqhPEJOK0v34NT/NTe5z8OKdfD0hQIgbyTMvwywbhjZrTVOLck4NidqCfHZeCJPVqBhePOhe0
 kj+eJb7cVXlemXVf1uB4/Qif614ylybHUUp+XqeR+xoJgiRAI9jhVWWRCvWHIhX619yXhpYe5
 VQCCcvRyv+ptoUaHpM512vQrSAYh/th++vNO+mllX43LBu/SPs6PTJU8XzQmn4q+TEJSmzSAK
 4hbxI5FBmfaEVxUQd53ld0fAGdq5u1gFIPR/Mg==
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
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
X-List-Received-Date: Tue, 19 Oct 2021 09:18:57 -0000

Le 19/10/2021 à 11:03, Kashyap Chamarthy a écrit :
> The original wiki is here[1].  I converted by copying the wiki source
> into a .wiki file and convert to rST using `pandoc`:
> 
>         $ pandoc -f Mediawiki -t rst trivial-patches.wiki -o trivial-patches.rst
> 
> Update the active maintainer names to reflect current reality.
> 
> [1] https://wiki.qemu.org/Contribute/TrivialPatches
> 
> Signed-off-by: Kashyap Chamarthy <kchamart@redhat.com>
> ---
> I've only retained Laurent's name as per Philip's review here:
> https://lists.nongnu.org/archive/html/qemu-devel/2021-09/msg05624.html

Thank you Kashyap.

so you should also remove Michael's repo (corpit.ru).

Thanks,
Laurent

> ---
>  docs/devel/trivial-patches.rst | 51 ++++++++++++++++++++++++++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 docs/devel/trivial-patches.rst
> 
> diff --git a/docs/devel/trivial-patches.rst b/docs/devel/trivial-patches.rst
> new file mode 100644
> index 0000000000..7df0f901f5
> --- /dev/null
> +++ b/docs/devel/trivial-patches.rst
> @@ -0,0 +1,51 @@
> +Trivial Patches
> +===============
> +
> +Overview
> +--------
> +
> +Trivial patches that change just a few lines of code sometimes languish
> +on the mailing list even though they require only a small amount of
> +review. This is often the case for patches that do not fall under an
> +actively maintained subsystem and therefore fall through the cracks.
> +
> +The trivial patches team take on the task of reviewing and building pull
> +requests for patches that:
> +
> +- Do not fall under an actively maintained subsystem.
> +- Are single patches or short series (max 2-4 patches).
> +- Only touch a few lines of code.
> +
> +**You should hint that your patch is a candidate by CCing
> +qemu-trivial@nongnu.org.**
> +
> +Repositories
> +------------
> +
> +Since the trivial patch team rotates maintainership there is only one
> +active repository at a time:
> +
> +- git://git.corpit.ru/qemu.git trivial-patches - `browse <http://git.corpit.ru/?p=qemu.git;a=shortlog;h=refs/heads/trivial-patches>`__
> +- git://github.com/vivier/qemu.git trivial-patches - `browse <https://github.com/vivier/qemu/tree/trivial-patches>`__
> +
> +Workflow
> +--------
> +
> +The trivial patches team rotates the duty of collecting trivial patches
> +amongst its members. A team member's job is to:
> +
> +1. Identify trivial patches on the development mailing list.
> +2. Review trivial patches, merge them into a git tree, and reply to state
> +   that the patch is queued.
> +3. Send pull requests to the development mailing list once a week.
> +
> +A single team member can be on duty as long as they like. The suggested
> +time is 1 week before handing off to the next member.
> +
> +Team
> +----
> +
> +If you would like to join the trivial patches team, contact Laurent
> +Vivier. The current team includes:
> +
> +- `Laurent Vivier <mailto:laurent@vivier.eu>`__
> 


