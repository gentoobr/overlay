# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"
ETYPE="sources"
K_SECURITY_UNSUPPORTED="1"
K_WANT_GENPATCHES="base extras experimental"
K_GENPATCHES_VER="304"
CLEAR_VER="${PV}-208"

inherit kernel-2
detect_version
detect_arch

KEYWORDS="amd64 x86"
HOMEPAGE="https://github.com/clearlinux-pkgs/linux-lts2017"
IUSE="experimental"

DESCRIPTION="Clear Linux sources including Gentoo patchset for the ${KV_MAJOR}.${KV_MINOR} kernel tree"

CLEAR_URI="https://github.com/clearlinux-pkgs/linux-lts2017/archive/refs/tags/${CLEAR_VER}.tar.gz"
SRC_URI="${KERNEL_URI} ${GENPATCHES_URI} ${ARCH_URI} ${CLEAR_URI}"
CLEAR_PATCHDIR="${WORKDIR}/linux-lts2017-${CLEAR_VER}"

UNIPATCH_STRICTORDER=1
UNIPATCH_LIST="
	"${CLEAR_PATCHDIR}"/0101-i8042-decrease-debug-message-level-to-info.patch
	"${CLEAR_PATCHDIR}"/0102-init-do_mounts-recreate-dev-root.patch
	"${CLEAR_PATCHDIR}"/0103-Increase-the-ext4-default-commit-age.patch
	"${CLEAR_PATCHDIR}"/0104-silence-rapl.patch
	"${CLEAR_PATCHDIR}"/0105-pci-pme-wakeups.patch
	"${CLEAR_PATCHDIR}"/0106-ksm-wakeups.patch
	"${CLEAR_PATCHDIR}"/0107-intel_idle-tweak-cpuidle-cstates.patch
	"${CLEAR_PATCHDIR}"/0108-xattr-allow-setting-user.-attributes-on-symlinks-by-.patch
	"${CLEAR_PATCHDIR}"/0109-init_task-faster-timerslack.patch
	"${CLEAR_PATCHDIR}"/0110-fs-ext4-fsync-optimize-double-fsync-a-bunch.patch
	"${CLEAR_PATCHDIR}"/0111-overload-on-wakeup.patch
	"${CLEAR_PATCHDIR}"/0112-bootstats-add-printk-s-to-measure-boot-time-in-more-.patch
	"${CLEAR_PATCHDIR}"/0113-fix-initcall-timestamps.patch
	"${CLEAR_PATCHDIR}"/0114-smpboot-reuse-timer-calibration.patch
	"${CLEAR_PATCHDIR}"/0115-raid6-add-Kconfig-option-to-skip-raid6-benchmarking.patch
	"${CLEAR_PATCHDIR}"/0116-Initialize-ata-before-graphics.patch
	"${CLEAR_PATCHDIR}"/0117-reduce-e1000e-boot-time-by-tightening-sleep-ranges.patch
	"${CLEAR_PATCHDIR}"/0119-e1000e-change-default-policy.patch
	"${CLEAR_PATCHDIR}"/0120-ipv4-tcp-allow-the-memory-tuning-for-tcp-to-go-a-lit.patch
	"${CLEAR_PATCHDIR}"/0121-disable-PM-on-some-NICs.patch
	"${CLEAR_PATCHDIR}"/0122-tweak-perfbias.patch
	"${CLEAR_PATCHDIR}"/0123-e1000e-increase-pause-and-refresh-time.patch
	"${CLEAR_PATCHDIR}"/0124-kernel-time-reduce-ntp-wakeups.patch
	"${CLEAR_PATCHDIR}"/0125-init-wait-for-partition-and-retry-scan.patch
	"${CLEAR_PATCHDIR}"/0126-print-fsync-count-for-bootchart.patch
	"${CLEAR_PATCHDIR}"/0127-zero-extra-registers.patch
	"${CLEAR_PATCHDIR}"/0128-Enable-stateless-firmware-loading.patch
	"${CLEAR_PATCHDIR}"/0129-Migrate-some-systemd-defaults-to-the-kernel-defaults.patch
	"${CLEAR_PATCHDIR}"/1001-WireGuard-fast-modern-secure-kernel-VPN-tunnel.patch
"

src_unpack() {
	unpack "${CLEAR_VER}.tar.gz"
	kernel-2_src_unpack
	tail +24 "${CLEAR_PATCHDIR}/config" > "${S}/arch/x86/configs/clear.config"
	rm -rf "${CLEAR_PATCHDIR}"
}

pkg_postinst() {
	kernel-2_pkg_postinst
	einfo "The default Clear Linux configuration is installed as a fragment."
	einfo "If you want to use it, run \"make defconfig clear.config\"."
}

pkg_postrm() {
	kernel-2_pkg_postrm
}
