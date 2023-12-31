from pybamm import exp, constants, Parameter, Variable
# import pybamm

# def graphite_electrolyte_exchange_current_density_PeymanMPM(c_e, c_s_surf, c_s_max, T):
def graphite_electrolyte_exchange_current_density_AndrewMPM(c_e, c_s_surf, c_s_max, T,N_nick):
    
    """
    Exchange-current density for Butler-Volmer reactions between graphite and LiPF6 in
    EC:DMC.
    Check the unit of Reaction rate constant k0 is from Peyman MPM.

    References
    ----------
    .. [2] http://www.cchem.berkeley.edu/jsngrp/fortran.html

    Parameters
    ----------
    c_e : :class:`pybamm.Symbol`
        Electrolyte concentration [mol.m-3]
    c_s_surf : :class:`pybamm.Symbol`
        Particle concentration [mol.m-3]
    c_s_max : :class:`pybamm.Symbol`
        Maximum particle concentration [mol.m-3]
    T : :class:`pybamm.Symbol`
        Temperature [K]

    Returns
    -------
    :class:`pybamm.Symbol`
        Exchange-current density [A.m-2]
    """
    m_ref =  Parameter("Negative electrode reference exchange-current density [A.m-2(m3.mol)1.5]")
    k_Nickel_intercalation_n = Parameter("Negative electrode dissolution nickel intercalation coefficient")
# #     Multiplier_diss=1 - N_nick * k_Nickel_intercalation_n
    Multiplier_diss=1/(1 + N_nick * k_Nickel_intercalation_n)
#     Multiplier_diss = 1
    
    # m_ref = 4*1.061 * 10 ** (-6)  # unit has been converted
    # units are (A/m2)(mol/m3)**1.5 - includes ref concentrations
#     E_r = 37480
    E_r=0
    arrhenius = exp(E_r / constants.R * (1 / 298.15 - 1 / T))
#     arrhenius = exp(E_r / constants.R * (1 / 318.15 - 1 / T))

    return (
        m_ref * Multiplier_diss * arrhenius * c_e**0.5 * c_s_surf**0.5 * (c_s_max - c_s_surf) ** 0.5
    )
